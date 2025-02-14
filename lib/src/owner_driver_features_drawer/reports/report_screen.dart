import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../imports.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reportScreen),
      ),
      body: Consumer<ReportProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: cTextDarkGrey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: DropdownButton<String>(
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              isExpanded: true,
                              value: provider.selectedReport,
                              onChanged: (String? newValue) {
                                provider.selectReport(newValue);
                              },
                              items: provider.dataMap.keys
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            final pickedDates = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDates != null) {
                              provider.setDateRange(
                                  pickedDates.start, pickedDates.end);
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                buildSelectedDateText(
                    provider.startDate, provider.endDate, context, provider),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      PieSeries<Report, String>(
                        radius: '80%', // Adjusted the radius to make it larger
                        dataSource: provider.selectedReport != null
                            ? provider.dataMap[provider.selectedReport]!
                            : [],
                        xValueMapper: (Report data, _) => data.label,
                        yValueMapper: (Report data, _) => data.value,
                        pointColorMapper: (Report data, _) => data.color,
                        // innerRadius: '0%',
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                          connectorLineSettings:
                              ConnectorLineSettings(type: ConnectorType.curve),
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        dataLabelMapper: (Report data, _) {
                          return ' ${data.value.toStringAsFixed(0)}';
                        },
                      ),
                    ],
                    legend: Legend(
                      alignment: ChartAlignment.center,
                      backgroundColor: Colors.blueGrey.shade50,
                      title: LegendTitle(
                          text: AppLocalizations.of(context)!.chartData,
                          textStyle: const TextStyle(fontSize: 20)),
                      isVisible: true,
                      orientation: LegendItemOrientation.vertical,
                      overflowMode: LegendItemOverflowMode.wrap,
                      position: LegendPosition.bottom,
                      textStyle: const TextStyle(fontSize: 15),
                      iconHeight: 17,
                      iconWidth: 17,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
