import '../../../../imports.dart';

class WithdrawMoneyScreen extends StatelessWidget {
  WithdrawMoneyScreen({super.key});
  final TextEditingController _withdrawAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.withdrawMoney),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(image: AssetImage(imgWallet)),
                          Column(
                            children: [
                              CustomTextWidget(
                                  text:
                                      AppLocalizations.of(context)!.totalAmount,
                                  size: 18,
                                  color: cDarkBlack,
                                  weight: FontWeight.bold),
                              const CustomTextWidget(
                                  text: '₹ 12000.00',
                                  size: 24,
                                  color: Colors.green,
                                  weight: FontWeight.bold),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomTextWidget(
                        text: AppLocalizations.of(context)!.amount,
                        size: 18,
                        color: cDarkBlack,
                        weight: FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomTextFormField(
                          textEditingController: _withdrawAmount,
                          textInputType: TextInputType.phone,
                          isPass: false,
                          hint: AppLocalizations.of(context)!.enterAmount),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     // Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //     builder: (context) => const WithdrawSuccess(),
                    //     //   ),
                    //     // );
                    //   },
                    //   child: paymentOption('assets/images/bank.png',
                    //       'Bank Account', 'All India banks'),
                    // ),
                    // paymentOption('assets/images/upi.png', 'UPI',
                    //     'Instant Payment using UPI App'),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WithdrawSuccess()),
                          );
                        },
                        title: AppLocalizations.of(context)!.withdrawMoney),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BankAccountScreen(),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.addBankAccount)
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
