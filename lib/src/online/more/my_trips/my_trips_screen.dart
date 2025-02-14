import '../../../../imports.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({super.key});

  @override
  Widget build(BuildContext context) {
    final myRidesProvider = Provider.of<MyRidesProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: pPagePadding_10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomHeader(title: 'My trips'),
                  ],
                ),
              ),
              buildSelectedDateText(myRidesProvider.startDate,
                  myRidesProvider.endDate, context, myRidesProvider,
                  selectedOption: myRidesProvider.selectedOption),
              _DropDownMenu(myRidesProvider: myRidesProvider),
              sizedBoxHeight10,
              _buildSelectedWidget(myRidesProvider.selectedOption),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSelectedDateText(DateTime? startDate, DateTime? endDate,
  //     BuildContext context, String selectedOption) {
  //   final myRidesProvider = Provider.of<MyRidesProvider>(context);

  //   final isDateRangeVisible = startDate != null &&
  //       endDate != null &&
  //       selectedOption != 'Ongoing' &&
  //       selectedOption != 'Scheduled';

  //   return isDateRangeVisible
  //       ? Padding(
  //           padding: pPaddingHorizontal_10,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               Text(
  //                 '${'Selected date range'}: ${DateFormat('dd-MM-yyyy').format(startDate)} - ${DateFormat('dd-MM-yyyy').format(endDate)}',
  //                 style: tsSmallTextBold,
  //               ),
  //               IconButton(
  //                 onPressed: () {
  //                   myRidesProvider.clearDateRange();
  //                 },
  //                 icon: const Icon(
  //                   Icons.cancel,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       : const SizedBox();
  // }

  Widget _buildSelectedWidget(String selectedOption) {
    switch (selectedOption) {
      case 'Ongoing':
        return const OngoingRides();
      case 'Past':
        return const PastRides();
      /*case 'Cancelled':
        return const CancelledRides();*/
      case 'Scheduled':
        return const ScheduledScreen();
      default:
        return Container();
    }
  }
}

class _DropDownMenu extends StatelessWidget {
  final MyRidesProvider myRidesProvider;

  const _DropDownMenu({required this.myRidesProvider});

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      // 'Ongoing',
      'Past',
      // 'Cancelled',
      'Scheduled'];

    return Padding(
      padding: pPaddingHorizontal_16,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: cGreyColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: pPagePadding_12,
          child: DropdownButton<String>(
            underline: const SizedBox(),
            value: myRidesProvider.selectedOption,
            onChanged: (String? newValue) {
              if (newValue != null) {
                myRidesProvider.setSelectedOption(newValue);
              }
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  width: 100,
                  child: Text(value),
                ),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}

Widget popupRow({
  String? leadtext,
  String? trailtext,
  Color? lc,
  Color? tc,
  double? ls,
  double? ts,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextWidget(
        text: leadtext!,
        size: ls ?? 16.0,
        color: lc ?? cDarkBlack,
        weight: FontWeight.bold,
      ),
      CustomTextWidget(
        text: trailtext!,
        size: ts ?? 16.0,
        color: tc ?? cDarkBlack,
        weight: FontWeight.bold,
      ),
    ],
  );
}
