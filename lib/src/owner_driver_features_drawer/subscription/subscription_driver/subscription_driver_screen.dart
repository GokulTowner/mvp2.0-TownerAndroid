import '../../../../imports.dart';

class SubscriptionDriverScreen extends StatelessWidget {
  const SubscriptionDriverScreen({super.key});

  double calculatePercentage(int remainingDays, int totalDays) {
    double percentage = (remainingDays / totalDays * 100) / 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<SubscriptionDriverProvider>(
          builder: (context, provider, child) {
            SubscriptionDriverModel? subscriptionDetails =
                provider.subscriptionDriverDetails;
            int remainingDays = subscriptionDetails.remainingDays;
            return Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                CustomHeader(
                  title:
                      AppLocalizations.of(context)!.driverSubscriptionDetails,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                                  subscriptionDetails.planName,
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
                                  subscriptionDetails.planAmount.toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: remainingDays < 1
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255, 123, 217, 126),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.info,
                                    color: remainingDays < 1
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
                              backgroundColor:
                                  remainingDays < 1 ? Colors.red : cMainGreen,
                              label: Text(
                                remainingDays < 1
                                    ? AppLocalizations.of(context)!.expired
                                    : AppLocalizations.of(context)!.active,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            Text(
                              subscriptionDetails.vehModel,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${subscriptionDetails.remainingDays.toString()} Days-',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: remainingDays < 1
                                      ? Colors.red
                                      : cDarkBlack),
                            ),
                            Text(
                              'left of ${subscriptionDetails.planValidity.toString()} days',
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
                            value: provider.percentage,
                            backgroundColor: cDarkBlack,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              provider.percentage < .20
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
                              Text(AppLocalizations.of(context)!.validity,
                                  style: tsSmallTextBold),
                              Text(subscriptionDetails.validityType,
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
                              Text(subscriptionDetails.startDate,
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
                              Text(subscriptionDetails.endDate,
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
                const Divider(),
                const Expanded(
                  child: ExpiredPlanWidgetDriver(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
