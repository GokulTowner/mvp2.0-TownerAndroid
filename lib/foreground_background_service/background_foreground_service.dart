import 'package:flutter_background_service_android/flutter_background_service_android.dart';

import '../imports.dart';
import 'dart:developer';
import 'dart:ui';
import 'package:socket_io_client/socket_io_client.dart' as io;

// Notification channel and ID
const notificationChannelId = 'my_foreground';
const notificationId = 888;

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // Configure Android Notification Channel
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId,
    'MY FOREGROUND SERVICE',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: notificationChannelId,
      initialNotificationTitle: 'Towner',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: notificationId,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  log("Service configured successfully.");
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  log("Service configured successfully.");

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Timer? periodicTimer;
  io.Socket? socket;

  // Connect to socket.io
  socket = io.io("your-server-url", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });

  socket.onConnect((_) {
    log('Connected. Socket ID: ${socket?.id}');
    // Implement your socket logic here
    // For example, you can listen for events or send data
  });

  socket.onDisconnect((_) {
    log('Disconnected...');
  });

  socket.on('event-name', (data) {
    log("Event received: $data");
  });

  // Set up periodic timer

  periodicTimer = Timer.periodic(
    const Duration(seconds: 60),
    (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          flutterLocalNotificationsPlugin.show(
            notificationId,
            'Towner Solution',
            'Your app is working on background ${DateTime.now()}',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                notificationChannelId,
                'MY FOREGROUND SERVICE',
                icon: 'ic_bg_service_small',
                ongoing: true,
              ),
            ),
          );

          log("Foreground service notification updated.");
        }
      }
      socket?.emit("event-name", "your-massage");
      log("service is successfully running.......... ${DateTime.now().second}");
    },
  );

  // Handle stop event
  service.on("stop").listen((event) {
    socket?.disconnect();
    periodicTimer?.cancel();
    service.stopSelf();
    log("Background process is now stopped");
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  log("iOS background service running.");
  return true;
}

void startBackgroundService() {
  final service = FlutterBackgroundService();
  service.startService();
}

void stopBackgroundService() {
  final service = FlutterBackgroundService();
  service.invoke("stop");
}

Future<void> restartBackgroundService() async {
  stopBackgroundService();
  await Future.delayed(
      const Duration(milliseconds: 100)); // Give some time for the service to stop
  startBackgroundService();
}
