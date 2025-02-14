import '../../../../imports.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomHeader(title: AppLocalizations.of(context)!.myWallet),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: Consumer<WalletProvider>(
                    builder: (context, provider, child) {
                      WalletModel walletModel = provider.walletModel;
                      List<Transaction> transactionHistoryList =
                          provider.walletModel.history;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: AppLocalizations.of(context)!.totalAmount,
                            size: 18.0,
                            color: cDarkBlack,
                            weight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: walletModel.totalAmount,
                                size: 24.0,
                                color: cMainGreen,
                                weight: FontWeight.bold,
                              ),
                              const Image(
                                image: AssetImage(imgWallet),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextButton(
                                  text: AppLocalizations.of(context)!.withdraw,
                                  color: cWhiteColor,
                                  callBack: () {
                                    Navigator.pushNamed(context,
                                        RouteClass.withdrawmoneyscreen);
                                  },
                                  textColor: cTextGrey,
                                  border: 1.0,
                                  borderColor: cTextGrey,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: CustomTextButton(
                                  text: AppLocalizations.of(context)!.addMoney,
                                  color: cMainGreen,
                                  callBack: () {
                                    Navigator.pushNamed(
                                        context, RouteClass.addmoneyscreen);
                                  },
                                  textColor: cTextGrey,
                                  border: 1.0,
                                  borderColor: Colors.transparent,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context,
                                    RouteClass.wallettransctionhistoryscreen);
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .viewAllTransactioniCaps,
                                style: TextStyle(
                                  color: cBackgroundGreen,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextWidget(
                            text: AppLocalizations.of(context)!.payNow,
                            size: 16.0,
                            color: cDarkBlack,
                            weight: FontWeight.bold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                imageWidget(
                                  const Image(
                                    image: AssetImage(imgSendMoney),
                                  ),
                                  AppLocalizations.of(context)!.sendMoney,
                                  () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>  MyWallet(),
                                    //   ),
                                    // );
                                  },
                                ),
                                imageWidget(
                                  const Image(
                                    image: AssetImage(
                                      imgGetMoney,
                                    ),
                                  ),
                                  AppLocalizations.of(context)!.requestmoney,
                                  () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //            requestMoneyOne()),
                                    // );
                                  },
                                ),
                                imageWidget(
                                  const Image(
                                    image: AssetImage(imgBonusLogo),
                                  ),
                                  AppLocalizations.of(context)!.bonus,
                                  () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BonusScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          sizedBoxHeight10,
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.history,
                              size: 16,
                              color: cDarkBlack,
                              weight: FontWeight.bold),
                          SizedBox(
                            height: 360,
                            child: ListView.builder(
                              itemCount: transactionHistoryList.length,
                              itemBuilder: (context, index) {
                                Transaction transaction =
                                    transactionHistoryList[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: customCard(
                                      transaction.id,
                                      transaction.amount,
                                      transaction.status,
                                      '${transaction.date} | ${transaction.time}'),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
