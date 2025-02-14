import '../imports.dart';

class AppCustomPopup {
  void showMessage({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subTitle,
    VoidCallback? onTap,
    String? buttonTitle,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: contentBox(
              context, imagePath, title, subTitle, onTap, buttonTitle),
        );
      },
    );
  }

  Widget contentBox(
    BuildContext context,
    String imagePath,
    String title,
    String subTitle,
    VoidCallback? onTap,
    String? buttonTitle,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        sizedBoxHeight20,
        Image.asset(
          imagePath, // Replace with your image path
          width: 300,
          height: 300,
        ),
        sizedBoxHeight20,
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        sizedBoxHeight20,
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        sizedBoxHeight20,
        onTap != null
            ? CustomButton(
                onTap: onTap,
                title: buttonTitle ?? '',
              )
            : const SizedBox(),
      ],
    );
  }
}
