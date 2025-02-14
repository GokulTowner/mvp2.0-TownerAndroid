import '../../../../imports.dart';

class DriverProfileCreateSuccessPopup {
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
        if (context.read<LoginProvider>().isOwner == true) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteClass.landingScreenOwner, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteClass.landingScreenDriver, (route) => false);
        }
      },
    );
    return SizedBox(
      height: 430,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:  WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              sizedBoxHeight20,
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                      imgVerificationBehind), // Replace with your first image
                  Center(
                    child: Image.asset(
                        imgVerificationFront), // Replace with your second image
                  ),
                ],
              ),
              const SizedBox(height: 0),
              const Text(
                'Submitted For Verification',
                style: tsMediumTextBold,
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight20,
              const Text(
                'Your T-Owner Add request has been sent to the T-Owner for verification',
                style: tsRegularTextWithColorDeepGrey,
                textAlign: TextAlign.justify,
              ),
              sizedBoxHeight20,
              Text(
                'We will update the status soon\nwith in 24 hours.',
                style: TextStyle(
                    color: cTextGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight20,
              // CustomButton(
              //   onTap: () {
              //     Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => EditProfileScreen(
              //             isOwner: true,
              //           ),
              //         ),
              //         (route) => false);
              //   },
              //   title: 'Go to home',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
