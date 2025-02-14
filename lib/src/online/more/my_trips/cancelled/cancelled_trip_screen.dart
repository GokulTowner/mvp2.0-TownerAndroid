import '../../../../../imports.dart';

class CancelledRides extends StatelessWidget {
  const CancelledRides({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    /*  return Consumer<PastRideProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        // List<PastTripModel?> pastTripData = provider.pastTrip;

        List<PastTripModel?> cancelledTrips = pastTripData
            .where((trip) => trip?.tripStatus == "Trip Cancelled")
            .toList();
        return const SizedBox();
       return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cancelledTrips.length,
          itemBuilder: (context, index) {
            PastTripModel? pastTrip = cancelledTrips[index];
            return Container(
              margin: pPaddingHorizontal_10,
              child: Column(
                children: [
                  sizedBoxHeight5,
                  ListTile(
                    title: Text(
                      "${AppLocalizations.of(context)!.tripId} : ${pastTrip?.tripId ?? ''}",
                      style: tsSmallTextBold,
                    ),
                    trailing: Chip(
                      backgroundColor: pastTrip?.tripStatus == "Cash Received"
                          ? cMainGreen
                          : cBloodRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      label: Text(
                        "${pastTrip?.serviceType ?? ''} - ${pastTrip?.vehicleType ?? ''}",
                        style: tsSmallText,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cWhiteColor,
                      radius: 26,
                      backgroundImage:
                          NetworkImage(pastTrip?.driverPhoto ?? ''),
                    ),
                    title: Text(
                      pastTrip?.driverName ?? '',
                      style: tsRegularText,
                    ),
                    subtitle: Text(
                      "${pastTrip?.vehicleNumber ?? ''}  |  ${pastTrip?.vehicleModel ?? ''}",
                      style: TextStyle(color: cTextGrey),
                    ),
                    trailing: Image.asset(imgCarLogo, scale: 1.5),
                  ),
                  sizedBoxHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.totalAmount,
                        style: tsSmallTextBold,
                      ),
                      sizedBoxHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pastTrip?.tripAmount ?? '',
                            style: tsSmallTextBold,
                          ),
                          sizedBoxWidth5,
                          Icon(
                            Icons.info,
                            size: 20.0,
                            color: cBorderGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  sizedBoxHeight10,
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${pastTrip?.tripDate ?? ''}  |  ${pastTrip?.tripTime ?? ''}",
                            style: TextStyle(color: cDarkBlack),
                          ),
                          sizedBoxWidth30,
                          SizedBox(
                            width: 120.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor:
                                      pastTrip?.tripStatus == "Cash Received"
                                          ? cStatusColorGreen
                                          : bloodRed,
                                  child: Icon(
                                    pastTrip?.tripStatus == "Cash Received"
                                        ? Icons.done
                                        : Icons.cancel,
                                    size: 20.0,
                                    color: cWhiteColor,
                                  ),
                                ),
                                Text(
                                  pastTrip?.tripStatus ?? '',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color:
                                        pastTrip?.tripStatus == "Cash Received"
                                            ? cStatusColorGreen
                                            : bloodRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: cWhiteColor,
                          radius: 26,
                          backgroundImage:
                              NetworkImage(pastTrip?.riderPic ?? ''),
                        ),
                        title: Text(
                          pastTrip?.riderName ?? '',
                          style: tsRegularText,
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: cAmber,
                            ),
                            Text(
                              pastTrip?.riderRating ?? '',
                              style: TextStyle(color: cTextGrey),
                            ),
                          ],
                        ),
                        trailing: Text(pastTrip?.tripTime ?? ''),
                      ),
                      sizedBoxHeight10,
                      if (pastTrip?.tripCancelledReason.isNotEmpty ??
                          false) ...[
                        sizedBoxHeight20,
                        Center(
                          child: Text(
                            "${AppLocalizations.of(context)!.reason} : ${pastTrip?.tripCancelledReason ?? ''}",
                            style: tsSmallTextBoldRed,
                          ),
                        ),
                      ],
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 70.0,
                              child: TimelineTile(
                                isFirst: true,
                                isLast: false,
                                endChild: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    pastTrip?.pickUpLocation ?? '',
                                    style: tsSmallText,
                                  ),
                                ),
                                beforeLineStyle: LineStyle(color: cGreyColor),
                                indicatorStyle:
                                    IndicatorStyle(color: cDarkBlack),
                              ),
                            ),
                            TimelineTile(
                              isFirst: false,
                              isLast: true,
                              beforeLineStyle: LineStyle(color: cGreyColor),
                              endChild: Container(
                                margin: const EdgeInsets.only(left: 15),
                                child: Text(
                                  pastTrip?.dropLocation ?? '',
                                  style: tsSmallText,
                                ),
                              ),
                              indicatorStyle: IndicatorStyle(
                                color: cBloodRed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight20,
                  const Divider(),
                  sizedBoxHeight10,
                ],
              ),
            );
          },
        );
      },
    );*/
  }
}
