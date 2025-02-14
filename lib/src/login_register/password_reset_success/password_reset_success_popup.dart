import '../../../imports.dart';

class PopupMessagePasswordResetSuccess {
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.loginScreen, (route) => false);
    });
    return SizedBox(
      height: 430,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              sizedBoxHeight20,
              Image.asset(
                imgSuccess, // Replace with your image path
                width: 300,
                height: 300,
              ),
              sizedBoxHeight20,
              Text(
                AppLocalizations.of(context)!.yourpasswordresetsuccessfully,
                style: tsMediumTextBold,
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight20
            ],
          ),
        ),
      ),
    );
  }
}
