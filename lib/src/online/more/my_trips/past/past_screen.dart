import '../../../../../imports.dart';
import 'model/my_trips_modal.dart';

class PastRides extends StatelessWidget {
  const PastRides({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PastRideProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        List<MyTripsModal?> trips = provider.pastTrip;
        print('past trips length :- ${trips.length}');
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: trips.length,
          itemBuilder: (context, index) {

            MyTripsModal? pastTrip = trips[index];

            return Container(
              margin: pPaddingHorizontal_10,
              child: Column(
                children: [
                  sizedBoxHeight5,
                  ListTile(
                    title: Text(
                      "${AppLocalizations.of(context)!.tripId} : ${pastTrip?.tripno.toString() ?? ''}",
                      style: tsSmallTextBold,
                    ),
                    trailing: Chip(
                      backgroundColor: pastTrip?.status?.toLowerCase() == "finished"
                          ? cMainGreen
                          : cBloodRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      label: Text(
                        "${pastTrip?.triptype ?? ''} - ${pastTrip?.vehicle ?? ''}",
                        style: tsSmallText,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cWhiteColor,
                      radius: 26,
                      backgroundImage:
                      const NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/030/798/360/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg'),
                    ),
                    title: Text(
                      pastTrip?.dvr ?? '',
                      style: tsRegularText,
                    ),
                    subtitle: Text(
                      "${pastTrip?.tripinvoicedriverdetails?.drivervehicleNumber ?? ''}  |  ${pastTrip?.vehicle ?? ''}",
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
                            pastTrip?.fare ?? '',
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
                            "${pastTrip?.date ?? ''}}",
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
                                  pastTrip?.status?.toLowerCase() == "Finished"
                                          ? cStatusColorGreen
                                          : bloodRed,
                                  child: Icon(
                                    pastTrip?.status == "Cash Received"
                                        ? Icons.done
                                        : Icons.cancel,
                                    size: 20.0,
                                    color: cWhiteColor,
                                  ),
                                ),
                                Text(
                                  pastTrip?.status ?? '',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color:
                                    pastTrip?.status?.toLowerCase() == "Finished"
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
                          const NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/030/798/360/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg'),
                        ),
                        title: Text(
                          pastTrip?.rid??"NA",
                          style: tsRegularText,
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: cAmber,
                            ),
                            Text(
                              pastTrip?.ridrating ?? '',
                              style: TextStyle(color: cTextGrey),
                            ),
                          ],
                        ),
                        trailing: Text(pastTrip?.estTime ?? ''),
                      ),
                      sizedBoxHeight10,
                      if (pastTrip?.review?.isNotEmpty ??
                          false) ...[
                        sizedBoxHeight20,
                        Center(
                          child: Text(
                            "${AppLocalizations.of(context)!.reason} : ${pastTrip?.review ?? ''}",
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
                                    pastTrip?.dsp?.start ?? '',
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
                                  pastTrip?.dsp?.end ?? '',
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
                  Container(
                    margin: pPaddingHorizontal_20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        padding: pPaddingVertical_8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: cDarkBlack,
                        side: BorderSide(
                          color: cGreyColor,
                          width: 1.0,
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: cWhiteColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              margin: pPaddingHorizontal_10,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 30.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    sizedBoxHeight30,
                                    Text(
                                      AppLocalizations.of(context)!.invoice,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    sizedBoxHeight10,
                                    popupRow(
                                      leadtext: AppLocalizations.of(context)!
                                          .totalAmount,
                                      trailtext: pastTrip?.fare ?? '',
                                      lc: cDarkBlack,
                                      tc: cSuccessGreen,
                                      ls: 16.0,
                                      ts: 16.0,
                                    ),
                                    sizedBoxHeight10,
                                    Divider(color: cGreyColor, thickness: 1.0),
                                    popupRow(
                                      leadtext: AppLocalizations.of(context)!
                                          .totalCharges,
                                      trailtext: pastTrip?.fare?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 16.0,
                                      ts: 16.0,
                                    ),


                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext:
                                      AppLocalizations.of(context)!.driver,
                                      trailtext: pastTrip?.dvr ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: 'Service type',
                                      trailtext: pastTrip?.triptype ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: 'Model',
                                      trailtext: pastTrip?.vehicle ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: AppLocalizations.of(context)!
                                          .vehiclenumber,
                                      trailtext: pastTrip?.tripinvoicedriverdetails?.drivervehicleNumber??'',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: 'Trip date',
                                      trailtext: pastTrip?.date??'',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: AppLocalizations.of(context)!
                                          .discount,
                                      trailtext: pastTrip?.acsp?.discountName ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: 'Conv charges',
                                      trailtext:
                                      pastTrip?.acsp?.conveyance?.toString() ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: "GST(6%)",
                                      trailtext: pastTrip?.acsp?.taxcgst.toString() ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: "SGST(6%)",
                                      trailtext: pastTrip?.acsp?.taxsgst.toString() ?? '',
                                      lc: cDarkBlack,
                                      tc: cDarkBlack,
                                      ls: 12.0,
                                      ts: 12.0,
                                    ),
                                    sizedBoxHeight20,
                                    popupRow(
                                      leadtext: 'Payable amount',
                                      trailtext: pastTrip?.fare.toString() ?? '',
                                      lc: cDarkBlack,
                                      tc: cSuccessGreen,
                                      ls: 16.0,
                                      ts: 16.0,
                                    ),
                                    sizedBoxHeight20,
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          side: BorderSide(
                                              color: cDarkBlack, width: 1.0),
                                          backgroundColor: cWhiteColor,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)!.close,
                                          style: tsExtraSmallTextBold,
                                        ),
                                      ),
                                    ),
                                    sizedBoxHeight20,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: cMainGreen,
                          ),
                          sizedBoxWidth10,
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  sizedBoxHeight10,
                ],
              ),
            );


          },
        );
      },
    );
  }
}
