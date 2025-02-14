import 'package:townerapp/imports.dart';

class NotificationWidgetTile extends StatelessWidget {
  final NotificationItems notification;
  final Function deleteItem;
  const NotificationWidgetTile(
      {required this.notification, required this.deleteItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: notification.read ? const Color(0xFFF1F2F6) : cMainGreen,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteClass.viewnotificationscreen);
            },
            child: Padding(
              padding: pPagePadding_8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: CustomCircularAvatar(name: notification.name),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        sizedBoxHeight5,
                        Text(
                          notification.text,
                          style: const TextStyle(
                              color: Color(0xFF676767), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Perform cancel action
                          },
                          icon: IconButton(
                            onPressed: () {
                              deleteItem();
                            },
                            icon: Icon(
                              Icons.close,
                              color: notification.read
                                  ? const Color(0xFF676767)
                                  : cBackgroundGreen,
                            ),
                          ),
                        ),
                        Text(
                          notification.date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
