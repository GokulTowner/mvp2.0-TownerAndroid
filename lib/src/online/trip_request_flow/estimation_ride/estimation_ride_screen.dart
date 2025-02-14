// ignore_for_file: deprecated_member_use
import 'package:firebase_database/firebase_database.dart';

import '../../../../imports.dart';

class EstimationRideContainer extends StatelessWidget {
  final String tripType;
  const EstimationRideContainer({String? tripType, super.key})
      : tripType = tripType ?? 'Daily Ride';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
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
                            builder:
                                (BuildContext context, provider, Widget? child) {
                              EstimationRideModel? estimateRide =
                                  provider.estimationRideData;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxHeight10,
                                  Text(
                                    '${AppLocalizations.of(context)!.estimationInsta} $tripType',
                                    style: TextStyle(
                                      color: cDarkBlack,
                                      fontSize: 22,
                                    ),
                                  ),
                                  sizedBoxHeight15,
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: cWhiteColor,
                                      radius: 26,
                                      backgroundImage: NetworkImage(
                                          estimateRide?.riderPic ?? ''),
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
                                  sizedBoxHeight15,
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
                                                      Column(
                                                        children: [
                                                          Text(
                                                            data['totalFare'],
                                                            style: const TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          const Text(
                                                            '10% off',
                                                            style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      )

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
                                  sizedBoxHeight20,
                                    StreamBuilder(
                                        stream: FirebaseDatabase.instance
                                            .ref()
                                            .child('trips_data')
                                            .child(provider.tripId.toString())
                                            .child("status")
                                            .onValue,
                                        builder: (context,snapshot){


                                          if(snapshot.connectionState == ConnectionState.waiting){
                                            return const Center(child: CircularProgressIndicator());
                                          }


                                          if(snapshot.hasError){
                                            return const SizedBox();
                                          }

                                          if(snapshot.hasData){
                                            if(snapshot.data?.snapshot.value == "2"){
                                              return Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                                            vertical: 12, horizontal: 40),
                                                        child: Center(
                                                          child: Text(
                                                            AppLocalizations.of(context)!
                                                                .reject,
                                                            style: tsRegularTextBold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      // Navigator.pop(context, true);
                                                      provider.startTrip(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: cMainGreen,
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 12, horizontal: 40),
                                                        child: Center(
                                                          child: Text(
                                                            AppLocalizations.of(context)!
                                                                .startTrip,
                                                            style: tsRegularTextBold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }else if(snapshot.data?.snapshot.value == "1"){
                                              return InkWell(
                                                onTap: () {
                                                  provider.intiMateArrive(context);
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
                                                        vertical: 12, horizontal: 40),
                                                    child: Center(
                                                      child: Text(
                                                        "Tap To Arrive",
                                                        style: tsRegularTextBold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const SizedBox();
                                            }
                                          }else{
                                            return const SizedBox();
                                          }


                                  }),
                                  sizedBoxHeight15,
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: cDarkBlack),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .navigateToRider,
                                        style: TextStyle(color: cMainGreen),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
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
      ),
    );
  }
}
