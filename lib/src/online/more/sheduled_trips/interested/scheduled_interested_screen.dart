import '../../../../../imports.dart';

class ScheduledIterested extends StatelessWidget {
  const ScheduledIterested({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ScheduledInterestedProvider>(
        builder: (BuildContext context, provider, Widget? child) {

          var interestedData = provider.trip;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return sizedBoxHeight10;
            },
            itemCount: interestedData.length,
            itemBuilder: (context, index) {
               var scheduledInterested = interestedData[index];
              return Padding(
                padding: pPaddingHorizontal_10,
                child: Card(
                  color: cWhiteColor,
                  child: SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          sizedBoxHeight10,
                          Padding(
                            padding: pPaddingHorizontal_16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                  backgroundColor: cMainGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            "${scheduledInterested?.bookingFor ?? ''} - ${scheduledInterested?.vehicle ?? ''}",
                                        size: 14.0,
                                        color: cDarkBlack,
                                        weight: FontWeight.w500,
                                      ),
                                      CustomTextWidget(
                                        text:
                                            "${scheduledInterested?.drivercmpnyname ?? ''} - ${scheduledInterested?.triptype ?? ''}",
                                        size: 14.0,
                                        color: cDarkBlack,
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: scheduledInterested?.date?.split(' ').first ?? '',
                                      size: 13.0,
                                      color: cDarkBlack,
                                      weight: FontWeight.bold,
                                    ),
                                    CustomTextWidget(
                                      text: scheduledInterested?.date?.split(' ')[1] ?? '',
                                      size: 13.0,
                                      color: cDarkBlack,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          sizedBoxHeight20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTextWidget(
                                text:
                                    "${AppLocalizations.of(context)!.tripId} :  ${scheduledInterested?.tripno ?? ''}",
                                size: 14.0,
                                color: cDarkBlack,
                                weight: FontWeight.bold,
                              ),
                              sizedBoxHeight30,
                            ],
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: cDarkBlack,
                              radius: 26,
                              backgroundImage: const NetworkImage(
                              'https://static.vecteezy.com/system/resources/thumbnails/030/798/360/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg'),
                            ),
                            title: CustomTextWidget(
                              text: scheduledInterested?.rid ?? '',
                              size: 14.0,
                              color: cDarkBlack,
                              weight: FontWeight.bold,
                            ),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: cAmber,
                                ),
                                CustomTextWidget(
                                  text: scheduledInterested?.ridrating ?? '',
                                  size: 14.0,
                                  color: cDarkBlack,
                                  weight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: cBlueGrey50,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBoxHeight5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextWidget(
                                      text: scheduledInterested?.dsp?.distanceKm ??
                                          '',
                                      size: 14.0,
                                      color: cDarkBlack,
                                      weight: FontWeight.w500,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          'Reach in - ${scheduledInterested?.scheduletripprocess?.riderrequestwaitingtime ?? ''}',
                                      size: 14.0,
                                      color: cDarkBlack,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                sizedBoxHeight10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: cDarkBlack,
                                        ),
                                        CustomTextWidget(
                                          text: scheduledInterested?.dsp?.distanceKm ??
                                              '',
                                          size: 14.0,
                                          color: cDarkBlack,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.lock_clock,
                                          color: cDarkBlack,
                                        ),
                                        CustomTextWidget(
                                          text: scheduledInterested?.estTime ??
                                              '',
                                          size: 14.0,
                                          color: cDarkBlack,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              'assets/images/community/miniRupees.png'),
                                        ),
                                        sizedBoxHeight5,
                                        CustomTextWidget(
                                          text:
                                              scheduledInterested?.fare ??
                                                  '',
                                          size: 14.0,
                                          color: cBackgroundGreen,
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                sizedBoxHeight10,
                                CustomTextWidget(
                                  text:
                                      "Extra Km  - ${scheduledInterested?.csp?.extraKm ?? ''}   |  Extra Minutes - ${scheduledInterested?.csp?.extraTime ?? ''}",
                                  size: 14.0,
                                  color: cTextGrey,
                                  weight: FontWeight.w500,
                                ),
                                sizedBoxHeight5,
                                CustomTextWidget(
                                  text:
                                      "Base Fare - ${scheduledInterested?.csp?.base?.toString() ?? ''}",
                                  size: 14.0,
                                  color: cTextGrey,
                                  weight: FontWeight.w500,
                                ),
                                sizedBoxHeight20,
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: TimelineTile(
                                    isFirst: true,
                                    isLast: false,
                                    beforeLineStyle:
                                        LineStyle(color: cLightGrey),
                                    indicatorStyle:
                                        IndicatorStyle(color: cDarkBlack),
                                    endChild: ListTile(
                                      title: CustomTextWidget(
                                        text: AppLocalizations.of(context)!
                                            .pickupLocation,
                                        size: 14.0,
                                        color: cTextGrey,
                                        weight: FontWeight.normal,
                                      ),
                                      subtitle: CustomTextWidget(
                                        text: scheduledInterested
                                                ?.dsp?.start ??
                                            '',
                                        size: 16.0,
                                        color: cDarkBlack,
                                        weight: FontWeight.bold,
                                      ),
                                      trailing: const Image(
                                        image: AssetImage(
                                            'assets/images/send.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: TimelineTile(
                                    isFirst: false,
                                    isLast: true,
                                    beforeLineStyle:
                                        LineStyle(color: cLightGrey),
                                    indicatorStyle:
                                        IndicatorStyle(color: cMainGreen),
                                    endChild: ListTile(
                                      title: CustomTextWidget(
                                        text: AppLocalizations.of(context)!
                                            .dropLocation,
                                        size: 14.0,
                                        color: cTextGrey,
                                        weight: FontWeight.normal,
                                      ),
                                      subtitle: CustomTextWidget(
                                        text:
                                            scheduledInterested?.dsp?.end ??
                                                '',
                                        size: 16.0,
                                        color: cDarkBlack,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                sizedBoxHeight20,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
