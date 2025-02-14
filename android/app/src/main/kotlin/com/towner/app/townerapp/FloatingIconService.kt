package com.towner.taxi

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.PixelFormat
import android.os.Build
import android.os.IBinder
import android.view.Gravity
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.ImageView
import androidx.core.app.NotificationCompat

class FloatingIconService : Service() {
    private lateinit var windowManager: WindowManager
    private lateinit var floatingView: View
    private lateinit var params: WindowManager.LayoutParams

    private var initialX: Int = 0
    private var initialY: Int = 0
    private var initialTouchX: Float = 0f
    private var initialTouchY: Float = 0f
    private var isDragging: Boolean = false
    private var isFloatingViewAdded: Boolean = false

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            when (intent?.action) {
                ACTION_SHOW_FLOATING_ICON -> showFloatingIcon()
                ACTION_HIDE_FLOATING_ICON -> hideFloatingIcon()
            }
        }
    }

    override fun onBind(intent: Intent): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        startForeground(NOTIFICATION_ID, createNotification())

        windowManager = getSystemService(WINDOW_SERVICE) as WindowManager
        setupFloatingView()

        val filter = IntentFilter().apply {
            addAction(ACTION_SHOW_FLOATING_ICON)
            addAction(ACTION_HIDE_FLOATING_ICON)
        }
        registerReceiver(receiver, filter,RECEIVER_EXPORTED)
    }

    private fun setupFloatingView() {
        floatingView = LayoutInflater.from(this).inflate(R.layout.layout_floating_icon, null)

        params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
            x = 0
            y = 100
        }

        setupTouchListener()
    }

    private fun showFloatingIcon() {
        if (!isFloatingViewAdded) {
            windowManager.addView(floatingView, params)
            isFloatingViewAdded = true
        }
    }

    private fun hideFloatingIcon() {
        if (isFloatingViewAdded) {
            windowManager.removeView(floatingView)
            isFloatingViewAdded = false
        }
    }

    private fun setupTouchListener() {
        floatingView.findViewById<ImageView>(R.id.floating_icon).setOnTouchListener { _, event ->
            when (event.action) {
                MotionEvent.ACTION_DOWN -> {
                    initialX = params.x
                    initialY = params.y
                    initialTouchX = event.rawX
                    initialTouchY = event.rawY
                    isDragging = false
                    true
                }
                MotionEvent.ACTION_MOVE -> {
                    val deltaX = event.rawX - initialTouchX
                    val deltaY = event.rawY - initialTouchY

                    if (!isDragging && (kotlin.math.abs(deltaX) > 5 || kotlin.math.abs(deltaY) > 5)) {
                        isDragging = true
                    }

                    if (isDragging) {
                        params.x = initialX + deltaX.toInt()
                        params.y = initialY + deltaY.toInt()
                        windowManager.updateViewLayout(floatingView, params)
                    }
                    true
                }
                MotionEvent.ACTION_UP -> {
                    if (!isDragging) {
                        // This was a click, not a drag
                        launchApp()
                    }
                    isDragging = false
                    true
                }
                else -> false
            }
        }
    }

    private fun launchApp() {
        val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
        if (launchIntent != null) {
            launchIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(launchIntent)
        }
    }

    private fun createNotification(): Notification {
        val channelId = "FloatingIconService"
        val channelName = "Floating Icon Service"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(channelId, channelName, NotificationManager.IMPORTANCE_LOW)
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }

        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(
            this, 0, notificationIntent, PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, channelId)
            .setContentTitle("Floating Icon")
            .setContentText("Tap to open the app")
            .setSmallIcon(R.drawable.logo)
            .setContentIntent(pendingIntent)
            .build()
    }

    override fun onDestroy() {
        super.onDestroy()
        hideFloatingIcon()
        unregisterReceiver(receiver)
        stopForeground(true)
    }

    companion object {
        private const val NOTIFICATION_ID = 1
        const val ACTION_SHOW_FLOATING_ICON = "com.towner.app.townerapp.SHOW_FLOATING_ICON"
        const val ACTION_HIDE_FLOATING_ICON = "com.towner.app.townerapp.HIDE_FLOATING_ICON"
    }
}