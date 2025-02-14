// ignore_for_file: must_be_immutable
import '../../../../imports.dart';

class BusinessContainer extends StatelessWidget {
  late bool expanded;
  BusinessContainer({
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateInvoiceProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
        return Container(
          decoration: BoxDecoration(
            color: cWhiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: (provider.isContainer1Expanded)
                      ? cDarkBlack
                      : cWhiteColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Business - Jain Travel - 0505',
                          style: TextStyle(
                            color: (provider.isContainer1Expanded)
                                ? cWhiteColor
                                : cDarkBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.isContainer1Expanded
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                size: 35,
                                color: (provider.isContainer1Expanded)
                                    ? cWhiteColor
                                    : cDarkBlack,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                                color: (provider.isContainer1Expanded)
                                    ? cWhiteColor
                                    : cDarkBlack,
                              ),
                        onPressed: () {
                          provider.toggleContainer1State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isContainer1Expanded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      sizedBoxHeight15,
                      ListTile(
                        leading: Image.asset('assets/images/dp1.png'),
                        title: Text(
                          bookingInvoiceData?.driverName ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          '⭐ ${bookingInvoiceData?.driverRating ?? ''}',
                          style: const TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile Id',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.profileId ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Reg. No.',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.vehicleRegNo ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Type',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.vehicleType ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seating Capacity',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.seatingCapacity ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle color',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.vehicleColor ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PAN No.',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.panNo ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST No.',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.gstNo ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
