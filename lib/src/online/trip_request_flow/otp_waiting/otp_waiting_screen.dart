// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';
import '../../../../imports.dart';

class OTPWaiting extends StatelessWidget {
  const OTPWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    final providerA = Provider.of<EstimationRideProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.7,
              widthFactor: 1.1,
              child: Dialog(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cWhiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          sizedBoxHeight20,
                          Text(
                            AppLocalizations.of(context)!.otp,
                            style: tsLargeText,
                          ),
                          sizedBoxHeight15,
                          Text(
                            AppLocalizations.of(context)!.enterOtp,
                            style: tsRegularTextWithColorDeepGrey,
                            textAlign: TextAlign.center,
                          ),
                          sizedBoxHeight30,
                          Padding(
                            padding: pPagePadding_8,
                            child: TextField(
                              maxLength: 4,
                              controller: providerA.otpController,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 15,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: cGreyColor,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '',
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                              ),
                            ),
                          ),
                          sizedBoxHeight10,
                          const CountdownTimer(),
                          sizedBoxHeight40,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  showBackConfirmationDialog(

                                    context,
                                    AppLocalizations.of(context)!.cancelRide,
                                    AppLocalizations.of(context)!
                                        .areYouSureCancelTheRide,
                                    AppLocalizations.of(context)!.no,
                                    AppLocalizations.of(context)!.yes,
                                    () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RouteClass.homeScreen,
                                          (route) => false);
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFa8a8a8),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 40),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                        style: tsRegularTextBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  providerA.providerSubmitOtp(context);

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cBackgroundGreen,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 40),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.verify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizedBoxHeight50,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
