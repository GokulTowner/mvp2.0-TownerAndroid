import 'package:firebase_database/firebase_database.dart';

import '../../../../imports.dart';

class IncomingRideContainer extends StatelessWidget {
  const IncomingRideContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountdownProvider(),
      child: const IncomingRideView(),
    );
  }
}

class IncomingRideView extends StatelessWidget {
  const IncomingRideView({super.key});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 55),
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1,
            widthFactor: 1.1,
            child: Dialog(
              child: StreamBuilder(
                stream: FirebaseDatabase.instance.ref().child('drivers_data').child(localStorageService.userDriver!.userId!).child('request').onValue,
                builder: (context,snapshots) {


                  if(snapshots.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }


                  var data = snapshots.data?.snapshot.value as Map;

                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cWhiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Consumer<EstimationRideProvider>(
                          builder: (BuildContext context, provider, Widget? child) {
                            EstimationRideModel? incomingRide =
                                provider.estimationRideData;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBoxHeight10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: cBackgroundGreen,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 7,
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          'Model - ${data['Vehicletype']}',
                                          style: tsRegularTextBold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: cAmber,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 7,
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          'Incoming - ${data['triptype']} ride',
                                          style: tsRegularTextBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBoxHeight15,
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: cWhiteColor,
                                    radius: 26,
                                    backgroundImage: NetworkImage(
                                        incomingRide?.riderPic ?? ''),
                                  ),
                                  title: Text(
                                    'NA',
                                    style: tsRegularTextBold,
                                  ),
                                  subtitle: const Text(
                                    'NA',
                                    style: tsSmallText,
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      /*String mobileNumber =
                                            estimateRide?.riderNumber ?? 'NA';
                                        provider.callFunction(mobileNumber);*/
                                    },
                                    child: const Image(
                                      image: AssetImage(imgCallLogo),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: cDarkBlack,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .fiber_manual_record_outlined,
                                                  size: 28,
                                                  color: cWhiteColor,
                                                ),
                                                sizedBoxWidth5,
                                                Text(data['totalKM'],
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
                                                  data['totaltime'],
                                                  style: TextStyle(
                                                    color: cWhiteColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                // Icon(
                                                //   Icons.currency_rupee_outlined,
                                                //   color: cWhiteColor,
                                                //   size: 18,
                                                // ),
                                                // sizedBoxWidth5,
                                                Column(
                                                  children: [
                                                    Text(
                                                      incomingRide?.tripAmount ??
                                                          '',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        decorationColor: cMainGreen,
                                                        decorationThickness: 1.5,
                                                        color: cWhiteColor,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    incomingRide?.discountAmt != ''
                                                        ?  Column(
                                                            children: [
                                                              Text(
                                                                data['totalFare'],
                                                                style: TextStyle(
                                                                  color:
                                                                      Colors.white,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              Text(
                                                                '10% off',
                                                                style: TextStyle(
                                                                  color:
                                                                      Colors.white,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : sizedBoxHeight0
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        sizedBoxHeight5,
                                        Text(
                                          'Extra Km - ${data['totaltime']}',
                                          style: tsSmallTextWhite,
                                        ),
                                        sizedBoxHeight5,
                                        Text(
                                          'Base Fare - ${data['basefare']}',
                                          style: tsSmallTextWhite,
                                        ),
                                        sizedBoxHeight5,
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Day bata -  ${data['day']??'-'}',
                                                style: tsSmallTextWhite,
                                              ),
                                            ],
                                          ),
                                        ),
                                        sizedBoxHeight5,
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Night bata - ${data['day']??'-'}',
                                                style: tsSmallTextWhite,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                sizedBoxHeight20,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: cDarkBlack,
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          color: cTextGrey,
                                          width: 2,
                                        ),
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: cMainGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                    sizedBoxWidth15,
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .pickupLocation,
                                            style: tsSmallTextGrey,
                                          ),
                                          sizedBoxHeight5,
                                          Text(
                                            data['picku_address'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                              style: tsSmallTextBold,
                                          ),
                                          sizedBoxHeight20,
                                          Text(
                                            AppLocalizations.of(context)!
                                                .dropLocation,
                                            style: tsSmallTextGrey,
                                          ),
                                          sizedBoxHeight5,
                                          Text(
                                            data['drop_address'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: tsSmallTextBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBoxHeight10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        provider.rejectTrip(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: cTextGrey,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 40,
                                          ),
                                          child: Text(
                                            AppLocalizations.of(context)!.reject,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.acceptRide(context, 1);

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: cMainGreen,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 40,
                                          ),
                                          child: Text(
                                            AppLocalizations.of(context)!.accept,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBoxHeight30,
                                Consumer<CountdownProvider>(
                                  builder: (context, countdownProvider, child) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 12,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: LinearProgressIndicator(
                                              value: countdownProvider.counter / 30,
                                              backgroundColor: cDarkBlack,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                cMainGreen,
                                              ),
                                            ),
                                          ),
                                        ),
                                        sizedBoxHeight10,
                                        Text(
                                          '${countdownProvider.counter} sec',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        sizedBoxHeight30,
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
