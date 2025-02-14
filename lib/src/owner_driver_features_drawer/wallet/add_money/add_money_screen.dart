import '../../../../imports.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addMoneyProvider = context.read<AddMoneyProvider>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: cDarkBlack,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: CustomTextWidget(
            text: AppLocalizations.of(context)!.addWallet,
            size: 18,
            color: cDarkBlack,
            weight: FontWeight.bold),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<AddMoneyProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                    text: AppLocalizations.of(context)!.addAmount,
                    size: 18,
                    color: cDarkBlack,
                    weight: FontWeight.bold),
                CustomTextFormField(
                    textEditingController: addMoneyProvider.addedAmount,
                    textInputType: TextInputType.number,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.enterAmount),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    onTap: () {
                      if (provider.addedAmount.text.isEmpty) {
                        flutterToastFailShort(
                            AppLocalizations.of(context)!
                                .theFieldIsEmptyEnterAmount,
                            14);
                        return;
                      }
                      int totalAmount = int.parse(provider.addedAmount.text);
                      provider.addMoneyToWallet();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SentMoneyWalletScreen(totalAmount: totalAmount),
                        ),
                      );
                    },
                    title: AppLocalizations.of(context)!.addMoney),
              ],
            );
          },
        ),
      ),
    );
  }
}
