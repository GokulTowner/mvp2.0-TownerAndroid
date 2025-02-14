import '../../../../imports.dart';

class InvoiceBillScreen extends StatelessWidget {
  final VehicleSubscriptionModel? invoiceData;
  const InvoiceBillScreen({this.invoiceData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 200,
                        child: Image(
                          image: AssetImage(imgLogo),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomHeader(title: ''),
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.invoiceId,
                              size: 20,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text:
                                  '       ${invoiceData!.invoiceData.invoiceId}',
                              size: 20,
                              color: cTextDarkGrey,
                              weight: FontWeight.w500),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.startDate,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.startDate ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.endDate,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.endDate ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.gstNo,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.invoiceData.gstNumber ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 20.0),
                        color: cLightGrey,
                        child: Padding(
                          padding: pPaddingVertical_6,
                          child: Column(
                            children: [
                              CustomTextWidget(
                                  text:
                                      AppLocalizations.of(context)!.amountPaid,
                                  size: 18,
                                  color: cDarkBlack,
                                  weight: FontWeight.bold),
                              CustomTextWidget(
                                  text: invoiceData?.planAmount.toString() ??
                                      'N/A',
                                  size: 30,
                                  color: cTextDarkGrey,
                                  weight: FontWeight.bold),
                              CustomTextWidget(
                                  text: invoiceData!.planName,
                                  size: 12,
                                  color: cTextDarkGrey,
                                  weight: FontWeight.w300)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: cLightGrey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage(imgownerSide),
                              height: 50.0,
                              width: 50.0,
                            ),
                            CustomTextWidget(
                                text:
                                    '${AppLocalizations.of(context)!.business} - ${invoiceData!.invoiceData.businessName}',
                                size: 16,
                                color: cDarkBlack,
                                weight: FontWeight.bold),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: cTextGrey,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!
                                  .businessProfileId,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.invoiceData.businessPrfId ??
                                  'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.drivername,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text:
                                  invoiceData?.invoiceData.driverName ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.vehicleRegNo,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.invoiceData.vehicleRegNo ??
                                  'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.vehicleType,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text:
                                  invoiceData?.invoiceData.vehicleType ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.panNo,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.invoiceData.panNumber ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.w500),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.gstNo,
                              size: 16,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          CustomTextWidget(
                              text: invoiceData?.invoiceData.gstNumber ?? 'N/A',
                              size: 15,
                              color: cTextDarkGrey,
                              weight: FontWeight.w500),
                        ],
                      ),
                      Container(
                        color: cLightGrey,
                        width: double.infinity,
                        padding: pPagePadding_10,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                    text: AppLocalizations.of(context)!
                                        .actualCharges,
                                    size: 16,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.bold),
                                CustomTextWidget(
                                    text: invoiceData
                                            ?.invoiceData.subGrossAmount
                                            .toString() ??
                                        'N/A',
                                    size: 15,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.w500),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                    text: AppLocalizations.of(context)!.cgst,
                                    size: 16,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.bold),
                                CustomTextWidget(
                                    text: invoiceData?.invoiceData.cgstValue
                                            .toString() ??
                                        'N/A',
                                    size: 15,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.w500),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                    text: AppLocalizations.of(context)!.sgst,
                                    size: 16,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.bold),
                                CustomTextWidget(
                                    text: invoiceData?.invoiceData.sgstValue
                                            .toString() ??
                                        'N/A',
                                    size: 15,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.w500),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                    text: AppLocalizations.of(context)!
                                        .driverDiscount,
                                    size: 16,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.bold),
                                CustomTextWidget(
                                    text: invoiceData?.invoiceData.convCharges
                                            .toString() ??
                                        'N/A',
                                    size: 15,
                                    color: cTextDarkGrey,
                                    weight: FontWeight.w500),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                      text: AppLocalizations.of(context)!
                                          .totalAmount,
                                      size: 18,
                                      color: cTextDarkGrey,
                                      weight: FontWeight.bold),
                                  CustomTextWidget(
                                      text:
                                          invoiceData?.planAmount.toString() ??
                                              'N/A',
                                      size: 17,
                                      color: cTextDarkGrey,
                                      weight: FontWeight.w500),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextButton(
                            text: AppLocalizations.of(context)!.download,
                            color: cMainGreen,
                            callBack: () {},
                            textColor: cDarkBlack,
                            border: 0.0,
                            borderColor: cWhiteColor,
                            fontSize: 16.0,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                backgroundColor: cMainGreen,
                              ),
                              onPressed: () {
                                context
                                    .read<RecommentedPlansProvider>()
                                    .shareFunction();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    color: cDarkBlack,
                                  ),
                                  CustomTextWidget(
                                    text: AppLocalizations.of(context)!
                                        .shareInvoice,
                                    size: 16.0,
                                    color: cDarkBlack,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
