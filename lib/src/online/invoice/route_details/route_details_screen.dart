import '../../../../imports.dart';

class RouteDetailsScreen extends StatelessWidget {
  const RouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OngoingDriverProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        DriverOnGoingModel? driverOnGoingModel = provider.driverOnGoingModel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: pPaddingHorizontal_10,
                child: Column(
                  children: [
                    const CustomHeader(title: 'Route details'),
                    sizedBoxHeight20,
                    Image.asset(
                      'assets/images/map_image.png',
                      height: 400,
                      width: 200,
                    ),
                    sizedBoxHeight40,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: cDarkWhiteBackground,
                              child: Icon(
                                Icons.location_on,
                                color: cMainGreen,
                              ),
                            ),
                            Container(
                              height: 100,
                              color: const Color(0xFFa8a8a8),
                              width: 2,
                            ),
                            CircleAvatar(
                              backgroundColor: cDarkWhiteBackground,
                              child: Icon(
                                Icons.location_on,
                                color: cBloodRed,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWidth10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.pickupLocation,
                              style: const TextStyle(
                                color: Color(0xFFa8a8a8),
                                fontSize: 18,
                              ),
                            ),
                            sizedBoxHeight10,
                            Text(
                              driverOnGoingModel?.pickUpLocation ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            sizedBoxHeight20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Start date & time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                sizedBoxWidth5,
                                Text(
                                  '${driverOnGoingModel?.tripStartDate ?? ''} | ${driverOnGoingModel?.tripStartTime ?? ''}',
                                  style: tsRegularTextWithColorGrey,
                                ),
                              ],
                            ),
                            sizedBoxHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'End date & time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                sizedBoxWidth5,
                                Text(
                                  '${driverOnGoingModel?.tripEndDate ?? ''} | ${driverOnGoingModel?.tripEndTime ?? ''}',
                                  style: tsRegularTextWithColorGrey,
                                ),
                              ],
                            ),
                            sizedBoxHeight30,
                            Text(
                              AppLocalizations.of(context)!.dropLocation,
                              style: const TextStyle(
                                color: Color(0xFFa8a8a8),
                                fontSize: 18,
                              ),
                            ),
                            sizedBoxHeight10,
                            Text(
                              driverOnGoingModel?.dropLocation ?? '',
                              style: tsRegularText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizedBoxHeight15,
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF242a38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fiber_manual_record_outlined,
                                      size: 28,
                                      color: cWhiteColor,
                                    ),
                                    sizedBoxWidth5,
                                    Text(
                                      driverOnGoingModel?.tripDistance ?? '',
                                      style: TextStyle(
                                        color: cWhiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: cWhiteColor,
                                    ),
                                    sizedBoxWidth5,
                                    Text(
                                      driverOnGoingModel?.tripTime ?? '',
                                      style: TextStyle(
                                        color: cWhiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      driverOnGoingModel?.tripAmount ?? '',
                                      style: TextStyle(
                                        color: cMainGreen,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight10,
                    Text(
                      'Booking ID ${driverOnGoingModel?.tripId ?? ''}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    sizedBoxHeight10,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
