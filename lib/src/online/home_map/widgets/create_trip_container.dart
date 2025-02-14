import '../../../../imports.dart';

class CreateTripContainer extends StatelessWidget {
  const CreateTripContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OwnTripServiceTypeProvider(),
      child: const CreateTripContent(),
    );
  }
}

class CreateTripContent extends StatelessWidget {
  const CreateTripContent({super.key});

  @override
  Widget build(BuildContext context) {
    final tripController = Provider.of<OwnTripServiceTypeProvider>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.7,
          widthFactor: 1.12,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cWhiteColor,
                ),
                child: Padding(
                  padding: pPagePadding_12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight15,
                      Text(
                        AppLocalizations.of(context)!.createOwnTrip,
                        style: tsLargeTextBold,
                      ),
                      sizedBoxHeight10,
                      Text(
                        AppLocalizations.of(context)!.selectTripType,
                        style: tsRegularTextWithColorDeepGrey,
                      ),
                      sizedBoxHeight10,
                      tripTypeOption(
                          context,
                          AppLocalizations.of(context)!.dailyRide,
                          1,
                          tripController),
                      sizedBoxHeight15,
                      tripTypeOption(
                          context,
                          AppLocalizations.of(context)!.rental,
                          2,
                          tripController),
                      sizedBoxHeight15,
                      tripTypeOption(
                          context,
                          AppLocalizations.of(context)!.outstation,
                          3,
                          tripController),
                      sizedBoxHeight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: cGrey500,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
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
                              tripController.proceed(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cMainGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.proceed,
                                    style: tsRegularTextBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget tripTypeOption(BuildContext context, String title, int option,
      OwnTripServiceTypeProvider controller) {
    return InkWell(
      onTap: () {
        controller.selectOption(option);
      },
      child: Container(
        decoration: BoxDecoration(
          color: controller.selectedOption == option ? cDarkBlack : cWhiteColor,
          border: controller.selectedOption != option
              ? Border.all(color: cGrey500, width: 1.0)
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50.0,
        child: Padding(
          padding: pPagePadding_8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: (controller.selectedOption == option)
                      ? cMainGreen
                      : const Color(0xFF676767),
                ),
              ),
              Icon(
                controller.selectedOption == option
                    ? Icons.check_circle
                    : Icons.done_outlined,
                color: (controller.selectedOption == option)
                    ? cMainGreen
                    : const Color(0xFF676767),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
