import '../../../../../imports.dart';

class AcceptedRide extends StatelessWidget {
  const AcceptedRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPaddingHorizontal_10,
        child: Card(
          elevation: 1,
          color: cWhiteColor,
          child: Padding(
            padding: pPagePadding_14,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Consumer<AcceptedRidePovider>(
                builder: (BuildContext context, provider, Widget? child) {
                  AcceptedRideModel? acceptedRide =
                      provider.acceptedRideDetails;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cWhiteColor,
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    acceptedRide?.driverPhoto ?? ''),
                              ),
                              title: Text(
                                acceptedRide?.driverName ?? '',
                                style: tsSmallTextBold,
                              ),
                              subtitle: Text('⭐ ${acceptedRide?.driverRating}'),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cDarkWhiteBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    acceptedRide?.tripTime ?? '',
                                    style: TextStyle(
                                      color: darkBlack,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.minutes,
                                    style: tsSmallText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cWhiteColor,
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    acceptedRide?.vehiclePhoto ?? ''),
                              ),
                              title: Text(
                                acceptedRide?.vehicleModel ?? '',
                                style: tsSmallTextBold,
                              ),
                              subtitle: Text(acceptedRide?.vehicleNumber ?? ''),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                acceptedRide?.tripAmount ?? '',
                                style: tsRegularText,
                              ),
                              const Text(
                                'Conditions apply',
                                style: tsExtraSmallText,
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizedBoxHeight5,
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: cGreyColor,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cDarkWhiteBackground,
                                child: Icon(
                                  Icons.location_on,
                                  color: cBlueMain,
                                ),
                              ),
                              title: Text(
                                AppLocalizations.of(context)!.pickupLocation,
                                style: tsSmallText,
                              ),
                              subtitle: Text(
                                acceptedRide?.pickUpLocation ?? '',
                                style: tsRegularTextBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cDarkWhiteBackground,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                              ),
                              title: Text(
                                AppLocalizations.of(context)!.dropLocation,
                                style: tsSmallText,
                              ),
                              subtitle: Text(
                                acceptedRide?.dropLocation ?? '',
                                style: tsRegularTextBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      const Divider(),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cWhiteColor,
                                radius: 26,
                                backgroundImage:
                                    NetworkImage(acceptedRide?.riderPic ?? ''),
                              ),
                              title: Text(
                                '${AppLocalizations.of(context)!.heyText}, ${acceptedRide?.riderName ?? ''}',
                                style: tsSmallTextBold,
                              ),
                              subtitle: Text(acceptedRide?.riderRating ?? ''),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: pPagePadding_10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: cDarkWhiteBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      CustomButton(onTap: () {}, title: 'Start Trip')
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
