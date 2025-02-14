import '../../../../../imports.dart';

class ExpiredPlanWidget extends StatelessWidget {
  const ExpiredPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, provider, child) {
        List<VehicleSubscriptionModel> subscriptionList =
            provider.noValidSubscription;

        return ListView.builder(
          itemCount: subscriptionList.length,
          itemBuilder: (context, index) {
            final subscription = subscriptionList[index];

            double percentage = provider.calculatePercentage(
                subscription.remainingDays, subscription.planValidity);

            return Padding(
              padding: pPaddingHorizontal_8,
              child: Column(
                children: [
                  sizedBoxHeight10,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteClass.buysubscriptionscreen);
                    },
                    child: Card(
                      color: cLightGrey,
                      child: Padding(
                        padding: pPagePadding_14,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subscription.planName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      subscription.planAmount.toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.red),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.info,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      subscription.remainingDays < 1
                                          ? Colors.red
                                          : cMainGreen,
                                  label:  Text(
                                    AppLocalizations.of(context)!.expired,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subscription.vehicleModel,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      subscription.vehicleNo,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${subscription.remainingDays.toString()} Days-',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: subscription.remainingDays < 1
                                          ? Colors.red
                                          : cDarkBlack),
                                ),
                                Text(
                                  'left of ${subscription.planValidity.toString()} days',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: cTextGrey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            // progress bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  5), // Rounded border for the progress indicator
                              child: LinearProgressIndicator(
                                minHeight: 10.0,
                                value: percentage,
                                backgroundColor: cDarkBlack,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  percentage < .20
                                      ? Colors.orange
                                      : percentage < .50
                                          ? Colors.yellow
                                          : cMainGreen,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(AppLocalizations.of(context)!.validity,
                                      style: tsSmallTextBold),
                                  Text(subscription.validityType,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: cTextGrey)),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                 Text(AppLocalizations.of(context)!.startDate,
                                      style: tsSmallTextBold),
                                  Text(subscription.startDate,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: cTextGrey)),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Text(AppLocalizations.of(context)!.endDate,
                                      style: tsSmallTextBold),
                                  Text(subscription.endDate,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: cTextGrey)),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RouteClass.recommendedplans);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                            subscription.remainingDays < 1
                                                ? Colors.red
                                                : cMainGreen,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                    child: Text(AppLocalizations.of(context)!.subscribeNow,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                subscription.remainingDays < 1
                                                    ? cWhiteColor
                                                    : cDarkBlack)),
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
              ),
            );
          },
        );
      },
    );
  }
}
