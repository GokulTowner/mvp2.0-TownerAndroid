import '../imports.dart';

void showBackConfirmationDialog(BuildContext context, String title,
    String subTitle, String buttonOne, String buttonTwo, VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(subTitle),
        actions: [
          ElevatedButton(
            onPressed: () {
              // User pressed Cancel
              Navigator.pop(context);
            },
            child: Text(buttonOne),
          ),
          const SizedBox(width: 70),
          ElevatedButton(
            onPressed: onTap,
            child: Text(buttonTwo),
          ),
        ],
      );
    },
  );
}
