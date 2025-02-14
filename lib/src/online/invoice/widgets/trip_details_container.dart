// ignore_for_file: must_be_immutable
import '../../../../imports.dart';

class TripDetailsContainer extends StatelessWidget {
  late bool expanded;
  TripDetailsContainer({
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateInvoiceProvider>(context);
    BookingInvoiceModel? bookingInvoiceData = provider.bookingInvoiceModel;
    return Consumer<CreateInvoiceProvider>(
      builder:
          (BuildContext context, CreateInvoiceProvider value, Widget? child) {
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
                  color:
                      provider.isContainer2Expanded ? cDarkBlack : cWhiteColor,
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
                          'Trip Details',
                          style: TextStyle(
                            color: provider.isContainer2Expanded
                                ? cWhiteColor
                                : cDarkBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.isContainer2Expanded
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                size: 35,
                                color: provider.isContainer2Expanded
                                    ? cWhiteColor
                                    : cDarkBlack,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                                color: provider.isContainer2Expanded
                                    ? cWhiteColor
                                    : cDarkBlack,
                              ),
                        onPressed: () {
                          provider.toggleContainer2State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isContainer2Expanded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      sizedBoxHeight15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mode of Booking',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.modeofBooking ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.pickUpLocation ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'To',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.dropLocation ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service type',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.serviceType ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Package:',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.package ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Base price(min):',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.basePrice ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Extra Km(for daily)',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.extraKm ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Extra time(min hrs per day)',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.extraTime ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total distance',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.totalDistance ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total riding time',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.totalRidingTime ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total bata count',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.totalBataCount ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Day bata 6am to 9pm',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.dayBata ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Night bata 9pm to 6am',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.nightBata ?? '',
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
