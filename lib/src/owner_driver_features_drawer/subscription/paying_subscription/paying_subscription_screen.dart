import '../../../../imports.dart';

class PayingSubscriptionScreen extends StatelessWidget {
  final int? totalAmount;
  const PayingSubscriptionScreen({this.totalAmount, super.key});

  @override
  Widget build(BuildContext context) {
    final payingSubscriptionProvider =
        Provider.of<PayingSubscriptionProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomHeader(
                  title: AppLocalizations.of(context)!.payingSubscription),
              Container(
                color: cWhiteColor,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TownerContainerWidget(totalAmount: totalAmount),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: context
                                  .watch<PayingSubscriptionProvider>()
                                  .isChecked,
                              activeColor: cMainGreen,
                              onChanged: (value) {
                                if (totalAmount == null) return;
                                payingSubscriptionProvider.setCheckBoxValue(
                                    value, totalAmount!);
                              },
                            ),
                            Text(AppLocalizations.of(context)!.walletAmount,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: cBorderGrey))
                          ],
                        ),
                        payingSubscriptionProvider.isChecked
                            ? Text(
                                '₹ ${payingSubscriptionProvider.balanceWalletAmount.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: cBorderGrey),
                              )
                            : Text(
                                '₹ ${payingSubscriptionProvider.walletAmount.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: cBorderGrey))
                      ],
                    ),
                    Text(AppLocalizations.of(context)!.applyCoupon,
                        style: tsRegularTextBold),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: cBloodRed, width: 2.0)),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                controller: payingSubscriptionProvider
                                    .couponCodeController,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.enterCode,
                                  hintStyle: tsRegularText,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 25.0),
                                backgroundColor: cMainGreen,
                              ),
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.apply,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: cDarkBlack),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
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
