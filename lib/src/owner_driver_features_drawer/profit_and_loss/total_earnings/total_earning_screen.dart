import 'dart:developer';
import '../../../../../imports.dart';

class TotalEarnings extends StatelessWidget {
  const TotalEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    // double percent = double.parse(percentage) / 100;
    return Scaffold(
      body: Container(
        margin: pPagePadding_10,
        child: Center(
          child: SafeArea(
            child: Consumer<TotalEarningsProvider>(
              builder: (context, provider, child) {
                List<TransactionDetails> transactions =
                    provider.totalEarningsModel.transctions;
                TotalEarningsModel totalEarningsModel =
                    provider.totalEarningsModel;
                double percentage =
                    double.parse(provider.cashEarningsPercent) / 100;
                double cashEarningPercentage =
                    100 - double.parse(provider.cashEarningsPercent);
                log('Percentage $percentage');
                return Column(
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.totalEarnings),
                    Container(
                      padding: pPagePadding_20,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: cLightGrey),
                      child: Column(
                        children: [
                          CircularPercentIndicator(
                            center: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  50), // Half of the width/height for circular shape
                              child: Center(
                                child: Text(
                                  '$cashEarningPercentage%',
                                  style: tsLargeTextBold,
                                ),
                              ),
                            ),
                            radius: 70,
                            progressColor: cBackgroundGreen,
                            lineWidth: 10,
                            percent: 1 - percentage,
                            backgroundColor: cBloodRed,
                          ),
                          CustomTextWidget(
                              text:
                                  '₹ ${totalEarningsModel.cashEarnings + totalEarningsModel.walletEarnings}',
                              size: 30,
                              color: cDarkBlack,
                              weight: FontWeight.w700),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                bookingTypeIndicator(
                                    "cash",
                                    AppLocalizations.of(context)!.cashEarning,
                                    '$cashEarningPercentage'),
                                bookingTypeIndicator(
                                    "expence",
                                    AppLocalizations.of(context)!.walletEarning,
                                    (100 - cashEarningPercentage)
                                        .toStringAsFixed(1))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                            text: AppLocalizations.of(context)!.allTransactions,
                            size: 14,
                            color: cDarkBlack,
                            weight: FontWeight.bold),
                        // CustomTextWidget(text: 'Cash', size: 14, color: cDarkBlack, weight: FontWeight.bold),
                        // CustomTextWidget(text: 'Wallet', size: 14, color: cDarkBlack, weight: FontWeight.bold),
                      ],
                    ),
                    Divider(color: darkMediumGrey, thickness: 1),
                    Expanded(
                      child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          TransactionDetails transaction = transactions[index];
                          return Column(
                            children: [
                              sizedBoxHeight15,
                              TransactionDetailWidget(
                                  transId: transaction.transactionId,
                                  transAmount: transaction.amount.toString(),
                                  dateAndTime: transaction.dateAndTime,
                                  gst: transaction.gst.toString(),
                                  status: transaction.status),
                            ],
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
    );
  }
}
