import '../../../../../imports.dart';

class OngoingRides extends StatelessWidget {
  const OngoingRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OngoingDriverProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        DriverOnGoingModel? driverOnGoingModel = provider.driverOnGoingModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.tripId} - ${driverOnGoingModel?.tripId ?? ''}',
                    style: tsRegularTextBold,
                  ),
                  Card(
                    color: cMainGreen,
                    child: Padding(
                      padding: pPagePadding_10,
                      child: Text(
                          '${driverOnGoingModel?.serviceType ?? ''} - ${driverOnGoingModel?.vehicleType ?? ''}'),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight20,
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: cWhiteColor,
                radius: 26,
                backgroundImage:
                    NetworkImage(driverOnGoingModel?.riderPic ?? ''),
              ),
              title: CustomTextWidget(
                text:
                    '${AppLocalizations.of(context)!.heyText}, ${driverOnGoingModel?.riderName ?? ''}',
                size: 15.0,
                color: cDarkBlack,
                weight: FontWeight.bold,
              ),
              subtitle: CustomTextWidget(
                text: driverOnGoingModel?.riderRating ?? '',
                size: 12.0,
                color: cTextBlack,
                weight: FontWeight.w700,
              ),
              trailing: Card(
                color: cMainGreen,
                child: Padding(
                  padding: pPagePadding_10,
                  child: Text(AppLocalizations.of(context)!.view),
                ),
              ),
            ),
            sizedBoxHeight5,
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.totalAmount,
                      style: tsSmallTextBold),
                  Text(
                    driverOnGoingModel?.tripAmount ?? '',
                    style: tsSmallTextBold,
                  )
                ],
              ),
            ),
            sizedBoxHeight5,
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${driverOnGoingModel?.tripStartDate ?? ''} | ${driverOnGoingModel?.tripStartTime ?? ''}'),
                  Text(
                    driverOnGoingModel?.tripDistance ?? '',
                    style: tsSmallTextBold,
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: cWhiteColor,
                radius: 26,
                backgroundImage:
                    NetworkImage(driverOnGoingModel?.driverPhoto ?? ''),
              ),
              title: CustomTextWidget(
                text: driverOnGoingModel?.driverName ?? '',
                size: 15.0,
                color: cDarkBlack,
                weight: FontWeight.bold,
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: cAmber,
                    size: 20.0,
                  ),
                  sizedBoxWidth5,
                  CustomTextWidget(
                    text: driverOnGoingModel?.driverRating ?? '',
                    size: 12.0,
                    color: cTextBlack,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 5.0,
                ),
                color: cBlueGrey50,
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: driverOnGoingModel?.tripDistance ?? '',
                      size: 15.0,
                      color: cDarkBlack,
                      weight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: driverOnGoingModel?.tripTime ?? '',
                      size: 12.0,
                      color: cTextBlack,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              isThreeLine: true,
              leading: CircleAvatar(
                backgroundColor: cWhiteColor,
                radius: 26,
                backgroundImage:
                    NetworkImage(driverOnGoingModel?.vehiclePhoto ?? ''),
              ),
              title: CustomTextWidget(
                text: driverOnGoingModel?.vehicleModel ?? '',
                size: 15.0,
                color: cDarkBlack,
                weight: FontWeight.bold,
              ),
              subtitle: CustomTextWidget(
                text: driverOnGoingModel?.vehicleNumber ?? '',
                size: 12.0,
                color: cTextBlack,
                weight: FontWeight.w700,
              ),
              trailing: CustomTextWidget(
                text: driverOnGoingModel?.tripAmount ?? '',
                size: 15.0,
                color: cDarkBlack,
                weight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
