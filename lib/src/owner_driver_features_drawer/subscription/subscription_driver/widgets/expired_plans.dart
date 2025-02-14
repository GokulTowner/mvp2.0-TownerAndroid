import '../../../../../imports.dart';

class ExpiredPlanWidgetDriver extends StatelessWidget {
  const ExpiredPlanWidgetDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionDriverProvider>(
      builder: (context, provider, child) {
        List<Plan> subscriptionList =
            provider.subscriptionDriverDetails.expiredPlans;
        return ListView.builder(
          itemCount: subscriptionList.length,
          itemBuilder: (context, index) {
            final subscription = subscriptionList[index];
            double percentage = provider.calculatePercentageExpiredPlans(
                subscription.remainingDays, subscription.planValidity);
            // double percentage = provider.calculatePercentage(
            //     subscription.remainingDays, subscription.planValidity);
            return Column(
              children: [
                sizedBoxHeight10,
                Card(
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
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: subscription.remainingDays < 1
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255, 123, 217, 126),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.info,
                                    color: subscription.remainingDays < 1
                                        ? Colors.red
                                        : cDarkBlack,
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
                              backgroundColor: subscription.remainingDays < 1
                                  ? Colors.red
                                  : cMainGreen,
                              label: Text(
                                subscription.remainingDays < 1
                                    ? AppLocalizations.of(context)!.expired
                                    : AppLocalizations.of(context)!.active,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            Text(
                              subscription.vehModel,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
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
                                  : provider.percentage < .50
                                      ? Colors.yellow
                                      : cMainGreen,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.validity,
                                style: tsSmallTextBold,
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
