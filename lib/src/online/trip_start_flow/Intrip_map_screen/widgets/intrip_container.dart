import '../../../../../imports.dart';

class IntripContainer extends StatelessWidget {
  const IntripContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.905,
      ),
      child: DraggableScrollableSheet(
        snapAnimationDuration: const Duration(milliseconds: 600),
        initialChildSize: 0.25,
        snap: true,
        maxChildSize: .95,
        minChildSize: 0.25,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cWhiteColor,
            ),
            child: Padding(
              padding: pPagePadding_12,
              child: Consumer<TripComptetedProvider>(
                builder: (BuildContext context, provider, Widget? child) {
                  TripComptetedModel? tripComplete = provider.tripCompletedData;
                  return ListView(
                    controller: scrollController,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: CustomButton(
                                  optionalHeight: 40,
                                  optionalTextColor: cBloodRed,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const RiderEndConfirmationPopup();
                                      },
                                    );
                                  },
                                  title: AppLocalizations.of(context)!.endtrip),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                await provider.launchGoogleMapsNavigation(
                                  12.9716, // source latitude
                                  77.5946, // source longitude
                                  12.9726, // destination latitude
                                  77.5956, // destination longitude
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Failed to launch navigation')),
                                );
                              }                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: cWhiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.navigation_outlined),
                                      Text(
                                        AppLocalizations.of(context)!.navigation,
                                        style: tsRegularTextBold,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      sizedBoxHeight15,
                      Text(
                        AppLocalizations.of(context)!.customerInformation,
                        style: tsRegularTextBold,
                      ),
                      sizedBoxHeight5,
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: cWhiteColor,
                                radius: 26,
                                backgroundImage:
                                    NetworkImage(tripComplete?.riderPic ?? ''),
                              ),
                              title: Text(
                                tripComplete?.riderName ?? '',
                                style: tsRegularTextBold,
                              ),
                              subtitle: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: cAmber,
                                  ),
                                  Text(
                                    tripComplete?.riderRating ?? '',
                                    style: tsSmallTextGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cWhiteColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: cGrey500,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Row(
                                children: [
                                  Image.asset(imgNavigationLogo),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.call,
                                    style: tsRegularTextBold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.tripDetails,
                            style: tsLargeText,
                          ),
                          Text(
                            '${AppLocalizations.of(context)!.bookingId}: ${tripComplete?.bookingId ?? ''}',
                            style: tsRegularText,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Container(
                        decoration: BoxDecoration(
                          color: cDarkBlack,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 13,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.fiber_manual_record_outlined,
                                    size: 28,
                                    color: cWhiteColor,
                                  ),
                                  sizedBoxWidth5,
                                  Text(
                                    tripComplete?.tripDistance ?? '',
                                    style: tsRegularTextWithColorWhite,
                                  ),
                                ],
                              ),
                              Text(
                                tripComplete?.tripAmount ?? '',
                                style: TextStyle(
                                  color: cBackgroundGreen,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: cDarkBlack,
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    color: cGrey500,
                                    width: 2,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: cBloodRed,
                                    ),
                                  ),
                                ],
                              ),
                              sizedBoxWidth15,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .pickupLocation,
                                    style: tsRegularTextWithColorGrey,
                                  ),
                                  sizedBoxWidth5,
                                  Text(
                                    tripComplete?.pickUpLocation ?? '',
                                    style: tsRegularTextBold,
                                  ),
                                  sizedBoxHeight20,
                                  Text(
                                    AppLocalizations.of(context)!.dropLocation,
                                    style: tsRegularTextWithColorGrey,
                                  ),
                                  sizedBoxHeight5,
                                  Text(
                                    tripComplete?.dropLocation ?? '',
                                    style: tsRegularTextBold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              sizedBoxHeight10,
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.message,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                              sizedBoxHeight10,
                              InkWell(
                                child: Image.asset(imgShareLogo),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TripShareScreen(),
                                    ),
                                  );
                                },
                              ),
                              sizedBoxHeight10,
                              InkWell(
                                child: Image.asset(imgSosLogo),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SosModeScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Text(
                        '${tripComplete?.vehicleNumber ?? ''} | ${tripComplete?.vehicleModel ?? ''}',
                        style: tsRegularTextWithColorDeepGrey,
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.tripStartTime,
                            style: tsRegularText,
                          ),
                          Text(
                            AppLocalizations.of(context)!.tripEndTime,
                            style: tsRegularText,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tripComplete?.tripStartTime ?? '',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            tripComplete?.tripEndTime ?? '',
                            style: tsRegularTextBold,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: cGrey500,
                              ),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: cGrey500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 5,
                              color: cGreyColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: cDarkBlack,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1),
                            ),
                            child: Center(
                              child: Image.asset(imgSmallCarPng),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 5,
                              color: cGreyColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: cGrey500,
                              ),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: cGrey500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.remainingTime} : ${tripComplete?.remainingTime ?? ''}',
                            style: TextStyle(
                              fontSize: 15,
                              color: cGrey500,
                            ),
                          )
                        ],
                      ),
                      sizedBoxHeight10,
                      CustomButton(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DriverFeedbackScreen(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.supportCaps,
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
