import '../../../imports.dart';

class PopupMessageAccountCreateSuccess {
  void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: contentBox(context),
        );
      },
    );
  }

  Widget contentBox(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          sizedBoxHeight20,
          Image.asset(
            imgSuccess,
            width: 300,
            height: 220,
          ),
          sizedBoxHeight20,
          const Text(
            tCongratulations,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          sizedBoxHeight20,
          const Text(
            tAccountCreateSuccessMessage,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          sizedBoxHeight20,
          CustomButton(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteClass.loginScreen, (route) => false);
            },
            title: tLoginNow,
          ),
        ],
      ),
    );
  }
}
