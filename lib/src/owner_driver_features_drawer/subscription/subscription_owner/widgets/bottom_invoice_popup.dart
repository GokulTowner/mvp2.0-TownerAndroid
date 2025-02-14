import '../../../../../imports.dart';

Future<Widget?> bottomSheetInvoice({
  required VehicleSubscriptionModel invoice,
  required BuildContext context,
}) async {
  return await showModalBottomSheet(
    backgroundColor: cWhiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 700,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Consumer<SubscriptionProvider>(
                builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomTextWidget(
                            text: AppLocalizations.of(context)!.invoice,
                            size: 20.0,
                            color: cTextGrey,
                            weight: FontWeight.w700,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          CustomTextWidget(
                            text: 'ID ${invoice.invoiceData.invoiceId}',
                            size: 20.0,
                            color: cDarkBlack,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextWidget(
                    text: '₹ ${invoice.planAmount}',
                    size: 40.0,
                    color: Colors.grey,
                    weight: FontWeight.bold,
                  ),
                  Divider(
                    color: cLightGrey,
                    height: 5,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 460,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.startDateTime),
                              Text(invoice.startDate),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.endDateTime),
                              Text(invoice.endDate),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.businessName),
                              Text(invoice.invoiceData.businessName),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.drivername),
                              Text(invoice.invoiceData.driverName),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.vehicleRegNo),
                              Text(invoice.invoiceData.vehicleRegNo),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.vehicleType),
                              Text(invoice.vehicleType),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.panNo),
                              Text(invoice.invoiceData.panNumber),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.gstNo),
                              Text(invoice.invoiceData.gstNumber),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: cLightGrey,
                            height: 5,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.totalCharges,
                                style: tsRegularTextBold,
                              ),
                              Text(
                                '₹ ${invoice.invoiceData.subGrossAmount}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: cTextGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.sgstNo),
                              Text(
                                  '₹ ${invoice.invoiceData.sgstValue.toString()}'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.cgstNo),
                              Text(
                                  '₹ ${invoice.invoiceData.cgstValue.toString()}'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.discount),
                              Text(invoice.invoiceData.discount.toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     const Text('Convinience :'),
                          //     Text(invoice.invoiceData.discount
                          //         .toString()),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                  text: 'Paid Amount',
                                  color: cDarkBlack,
                                  size: 16,
                                  weight: FontWeight.bold),
                              CustomTextWidget(
                                  text: '₹ ${invoice.planAmount}',
                                  color: cDarkBlack,
                                  size: 16,
                                  weight: FontWeight.bold),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        InvoiceBillScreen(invoiceData: invoice),
                                  ),
                                );
                              },
                              title: 'Download'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      );
    },
  );
}
