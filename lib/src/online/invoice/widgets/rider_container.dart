// ignore_for_file: must_be_immutable
import '../../../../imports.dart';

class RiderContainer extends StatelessWidget {
  late bool expanded;
  RiderContainer({
    super.key,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateInvoiceProvider>(context);

    return Consumer<CreateInvoiceProvider>(
      builder:
          (BuildContext context, CreateInvoiceProvider value, Widget? child) {
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
                  color:
                      provider.isContainer3Expanded ? cDarkBlack : cWhiteColor,
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
                          'Rider Profile',
                          style: TextStyle(
                            color: provider.isContainer3Expanded
                                ? cWhiteColor
                                : cDarkBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: provider.isContainer3Expanded
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                size: 35,
                                color: provider.isContainer3Expanded
                                    ? cWhiteColor
                                    : cDarkBlack,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                                color: provider.isContainer3Expanded
                                    ? cWhiteColor
                                    : cDarkBlack,
                              ),
                        onPressed: () {
                          provider.toggleContainer3State();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (provider.isContainer3Expanded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      sizedBoxHeight15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer name/ID',
                            style: tsRegularTextBold,
                          ),
                          Text(
                            bookingInvoiceData?.customerId ?? '',
                            style: tsRegularTextWithColorGrey,
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer PAN',
                            style: tsRegularTextBold,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cWhiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text(
                                bookingInvoiceData?.customerPan ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: cTextGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer GST',
                            style: tsRegularTextBold,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cWhiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text(
                                bookingInvoiceData?.customerGst ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: cTextGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer Address',
                            style: tsRegularTextBold,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cWhiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Text(
                                bookingInvoiceData?.customerAdress ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: cTextGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
