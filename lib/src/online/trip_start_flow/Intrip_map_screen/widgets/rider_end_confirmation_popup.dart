import '../../../../../imports.dart';

class RiderEndConfirmationPopup extends StatelessWidget {
  const RiderEndConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.33,
          widthFactor: 1.1,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      sizedBoxHeight20,
                      Text(
                        AppLocalizations.of(context)!
                            .areYouSureWantToEndtheTrip,
                        style: tsRegularText,
                        textAlign: TextAlign.center,
                      ),
                      sizedBoxHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: cTextGrey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.no,
                                    style: tsRegularTextBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<IntripProvider>().setIsIntrip(false);
                              Navigator.pop(context);
                              context.read<IntripProvider>().endTrip(context);

                              // Navigator.pushNamed(
                              //     context, RouteClass.rideendscreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cBackgroundGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.yes,
                                    style: tsRegularTextBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight40,
                    ],
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
