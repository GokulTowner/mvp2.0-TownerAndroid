import 'dart:developer';
import '../../../../../imports.dart';

class AppContainerWidget extends StatelessWidget {
  const AppContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BuySubscriptionProvider>(
      builder: (context, buySubscriptionProvider, child) {
        List<VehicleDetailsSubscriptionModel> vehicleDetailsSubscriptionList =
            buySubscriptionProvider.vehicleDetailsSubscriptionList;
        return ListView.builder(
          itemCount: vehicleDetailsSubscriptionList.length,
          itemBuilder: (context, index) {
            VehicleDetailsSubscriptionModel vehicleDetails =
                vehicleDetailsSubscriptionList[index];
            return Column(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: cBackgroundBlack,
                          radius: 30,
                          child: Icon(
                            Icons.drive_eta_outlined,
                            color: cMainGreen,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          vehicleDetails.vehicleModel,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${AppLocalizations.of(context)!.vehiclenumber}: ${vehicleDetails.vehicleNumber}'),
                            Text(
                                '${AppLocalizations.of(context)!.drivername}: ${vehicleDetails.driver}'),
                          ],
                        ),
                        trailing: buySubscriptionProvider.toSubscribe == true
                            ? Checkbox(
                                value: vehicleDetails.isChecked,
                                checkColor: cDarkBlack,
                                activeColor: cMainGreen,
                                onChanged: (bool? value) {
                                  buySubscriptionProvider.setIsChecked(
                                      index, value!);
                                },
                              )
                            : const SizedBox(),
                      ),
                      const Divider(),
                      buySubscriptionProvider.toSubscribe == true
                          ? Padding(
                              padding: pPagePadding_8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${AppLocalizations.of(context)!.selectSubscription}:',
                                      style: tsRegularText),
                                  DropdownButton<String>(
                                    underline: const SizedBox(),
                                    items: buySubscriptionProvider
                                        .subscriptionPlan
                                        .map((entry) {
                                      return DropdownMenuItem<String>(
                                        value: entry.id,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(entry.name),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Text('₹${entry.price.toString()}'),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    value:
                                        vehicleDetails.selectedSubscription.id,
                                    onChanged: (String? newValue) {
                                      log('message : $newValue');
                                      buySubscriptionProvider
                                          .setSelectedSubscription(
                                              index, newValue!);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${AppLocalizations.of(context)!.selectedSubscription}:',
                                      style: tsRegularText),
                                  Text(
                                      ' ${vehicleDetails.currentSubscription.name}',
                                      style: tsRegularText),
                                ],
                              ),
                            ),
                      const Divider(),
                      Text(
                          '${vehicleDetails.subValidity} ${AppLocalizations.of(context)!.daysLeft}',
                          style: tsRegularTextBold),
                      sizedBoxHeight5
                    ],
                  ),
                ),
                sizedBoxHeight10,
              ],
            );
          },
        );
      },
    );
  }
}
