import '../../../../imports.dart';

class SentMoneyWalletScreen extends StatelessWidget {
  final int totalAmount;
  const SentMoneyWalletScreen({required this.totalAmount, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomHeader(
                  title: AppLocalizations.of(context)!.addMoneyToWallet),
              Container(
                color: cWhiteColor,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TownerContainerWidget(
                      totalAmount: totalAmount,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 400,
                      color: cTextfieldBorder,
                      child: Padding(
                        padding: pPagePadding_8,
                        child: Text(
                          '9876543215',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: cBorderGrey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.allPaymentmethod,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // const PaymentMethodWidget(
                    //     image: 'assets/images/card.png',
                    //     title: 'Card',
                    //     subTitle: 'Visa, MasterCard & More'),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const PaymentMethodWidget(
                    //     image: 'assets/images/bank.png',
                    //     title: 'Netbanking',
                    //     subTitle: 'All India banks'),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const PaymentMethodWidget(
                        image: 'assets/images/upi.png',
                        title: 'UPI',
                        subTitle: 'Instant Payment using UPI App'),
                    const SizedBox(
                      height: 20,
                    ),
                    sizedBoxHeight50,
                    sizedBoxHeight50,
                    sizedBoxHeight50,
                    sizedBoxHeight50,
                    sizedBoxHeight50,
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteClass.paymentloadingprogress);
                          },
                          title: AppLocalizations.of(context)!.proceed),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
