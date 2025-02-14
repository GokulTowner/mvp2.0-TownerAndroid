import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../imports.dart';

class BusinessAnalyticsScreen extends StatelessWidget {
  const BusinessAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: pPaddingHorizontal_8,
              child: CustomHeader(
                  title: AppLocalizations.of(context)!.businessAnalytics),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Consumer<BusinessAnalyticsProvider>(
                  builder: (context, provider, child) {
                    List<Trip> trips =
                        provider.businessAnalyticsModel.totalTrips;

                    List<TripChartData> tripChartData = trips.map((trip) {
                      return TripChartData(
                        label: trip.label,
                        count: trip.count,
                        color: HexColor(trip.color),
                      );
                    }).toList();
                    List<PaymentType> paymentType =
                        provider.businessAnalyticsModel.pymntTypeOvrvw;

                    List<WorkingHours> workingHours =
                        provider.businessAnalyticsModel.totalWorkingHours;

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: cLightGrey,
                          ),
                          child: ListTile(
                            leading: CustomTextWidget(
                              text: (provider.startDate != null &&
                                      provider.endDate != null)
                                  ? "${provider.startDate} To ${provider.endDate}"
                                  : AppLocalizations.of(context)!
                                      .selectDateRange,
                              size: 16.0,
                              color: cTextGrey,
                              weight: FontWeight.w500,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                provider.selectDate(context);
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        sizedBoxHeight30,
                        Container(
                          padding: pPagePadding_10,
                          decoration: BoxDecoration(
                            color: cLightGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                      text: AppLocalizations.of(context)!
                                          .totalBusinessOverview,
                                      size: 16,
                                      color: cDarkBlack,
                                      weight: FontWeight.bold),
                                  Icon(
                                    Icons.share_outlined,
                                    color: cDarkBlack,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 500,
                                width: double.infinity,
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    PieSeries<TripChartData, String>(
                                      radius: '80%',
                                      dataSource: tripChartData,
                                      xValueMapper: (TripChartData data, _) =>
                                          data.label,
                                      yValueMapper: (TripChartData data, _) =>
                                          data.count,
                                      pointColorMapper:
                                          (TripChartData data, _) => data.color,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                        isVisible: true,
                                        labelPosition:
                                            ChartDataLabelPosition.outside,
                                        connectorLineSettings:
                                            ConnectorLineSettings(
                                                type: ConnectorType.curve),
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      dataLabelMapper: (TripChartData data, _) {
                                        return ' ${data.count.toString()}';
                                      },
                                    ),
                                  ],
                                  legend: Legend(
                                    alignment: ChartAlignment.center,
                                    backgroundColor: cBlueGrey50,
                                    title: LegendTitle(
                                      text: AppLocalizations.of(context)!
                                          .chartData,
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    isVisible: true,
                                    orientation: LegendItemOrientation.vertical,
                                    overflowMode: LegendItemOverflowMode.wrap,
                                    position: LegendPosition.bottom,
                                    textStyle: tsRegularText,
                                    iconHeight: 17,
                                    iconWidth: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxHeight20,
                        Container(
                          padding: pPagePadding_4,
                          decoration: BoxDecoration(
                            color: cLightGrey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                  text: AppLocalizations.of(context)!
                                      .paymentTypeOverview,
                                  size: 16.0,
                                  color: cDarkBlack,
                                  weight: FontWeight.bold),
                              imageWithBar(
                                  AppLocalizations.of(context)!.myWallet,
                                  paymentType[0].hours,
                                  imgMywallet),
                              imageWithBar(
                                  AppLocalizations.of(context)!.payCash,
                                  paymentType[1].hours,
                                  imgPaycash),
                              imageWithBar(
                                  AppLocalizations.of(context)!.otherMethods,
                                  paymentType[2].hours,
                                  imgUpitext),
                            ],
                          ),
                        ),
                        sizedBoxHeight30,
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: cLightGrey,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            padding: pPagePadding_10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                    text: AppLocalizations.of(context)!
                                        .totalWorkingHours,
                                    size: 16,
                                    color: cDarkBlack,
                                    weight: FontWeight.bold),
                                const Image(
                                  image: AssetImage(imgGraph),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: cBackgroundGreen,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        CustomTextWidget(
                                            text: AppLocalizations.of(context)!
                                                .online,
                                            size: 16,
                                            color: cTextGrey,
                                            weight: FontWeight.bold),
                                        CustomTextWidget(
                                          text: '${workingHours[0].hours}',
                                          size: 16,
                                          color: cDarkBlack,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: cBloodRed,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        CustomTextWidget(
                                            text: AppLocalizations.of(context)!
                                                .offline,
                                            size: 16,
                                            color: cTextGrey,
                                            weight: FontWeight.bold),
                                        CustomTextWidget(
                                          text: '${workingHours[1].hours}',
                                          size: 16,
                                          color: cDarkBlack,
                                          weight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripChartData {
  final String label;
  final int count;
  final Color color;

  TripChartData({
    required this.label,
    required this.count,
    required this.color,
  });
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
