import '../../../../imports.dart';

class BankAccountCreateSuccessPopup {
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
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteClass.landingScreenOwner, (route) => false);
      },
    );
    return SizedBox(
      height: 390,
      child: Scaffold(
        backgroundColor: cTransparent,
        body:  WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              sizedBoxHeight20,
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(imgVerificationBehind),
                  Center(
                    child: Image.asset(imgVerificationFront),
                  ),
                ],
              ),
              sizedBoxHeight0,
              Text(
                AppLocalizations.of(context)!.submittedForVerification,
                style: tsMediumTextBold,
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight20,
              Text(
                AppLocalizations.of(context)!
                    .yourTOwnerAddRequestHasBeenSentToTheTOwnerForVerification,
                style: tsRegularTextWithColorDeepGrey,
                textAlign: TextAlign.justify,
              ),
              sizedBoxHeight20,
              Text(
                AppLocalizations.of(context)!
                    .wewillUpdateTheStatusSoonWithInHours,
                style: tsRegularTextWithColorDeepGrey,
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight20,
            ],
          ),
        ),
      ),
    );
  }
}
