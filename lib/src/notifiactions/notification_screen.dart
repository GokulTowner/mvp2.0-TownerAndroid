import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../imports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const route = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    final notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);

    if (message != null && message is RemoteMessage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notificationProvider.addNotification(message);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<NotificationProvider>(
            builder: (context, notificationProvider, child) {
              return Column(
                children: [
                  const CustomHeader(title: 'Notifications'),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      notificationProvider.searchByTitle(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Notification',
                      hintText: 'Search Notification',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: notificationProvider.notificationList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/no notification.jpg',
                                  width: 200,
                                  height: 200,
                                ),
                                const Text(
                                  'No notifications available',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount:
                                  notificationProvider.notificationList.length,
                              itemBuilder: (context, index) {
                                var notification = notificationProvider
                                    .notificationList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ViewNotificationScreen(
                                          notification: notification,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            // Archive action
                                          },
                                          icon: Icons.archive,
                                          backgroundColor: Colors.green,
                                          label: 'Archive',
                                        ),
                                        SlidableAction(
                                          onPressed: (context) {
                                            notificationProvider
                                                .removeNotification(index);
                                          },
                                          icon: Icons.delete,
                                          backgroundColor: Colors.red,
                                          label: 'Delete',
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[50],
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification.notification?.title ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            notification.notification?.body ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      notificationProvider.clearAllNotifications();
                    },
                    child: const Text(
                      "Clear All",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
