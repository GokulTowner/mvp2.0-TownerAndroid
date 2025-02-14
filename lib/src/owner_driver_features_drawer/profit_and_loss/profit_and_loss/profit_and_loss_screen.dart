import 'package:townerapp/imports.dart';

class ProfitAndLoss extends StatelessWidget {
  const ProfitAndLoss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SafeArea(
            child: Consumer<ProfitAndLossProvider>(
              builder: (context, provider, child) {
                ProfitAndLossModel profitAndLossModel =
                    provider.profitAndLossModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxHeight10,
                    CustomHeader(
                        title: AppLocalizations.of(context)!.profitAndLoss),
                    sizedBoxHeight10,
                    Container(
                      padding: pPagePadding_20,
                      decoration: BoxDecoration(
                        color: cLightGrey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          sizedBoxHeight15,
                          CustomTextWidget(
                              text: AppLocalizations.of(context)!.overallProfit,
                              size: 18,
                              color: cTextDarkGrey,
                              weight: FontWeight.bold),
                          sizedBoxHeight15,
                          CircularPercentIndicator(
                            center: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  50), // Half of the width/height for circular shape
                              child: Center(
                                child: Text(
                                  provider.totalEarningsPercentage,
                                  style: tsLargeTextBold,
                                ),
                              ),
                            ),
                            radius: 70,
                            progressColor: cBackgroundGreen,
                            lineWidth: 10,
                            percent:
                                double.parse(provider.totalEarningsPercentage) /
                                    100,
                            backgroundColor: cBloodRed,
                          ),
                          sizedBoxHeight20,
                          CustomTextWidget(
                              text: '₹ ${provider.netProfitOrLoss}',
                              size: 30,
                              color: cDarkBlack,
                              weight: FontWeight.bold),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              bookingTypeIndicator(
                                  "earning",
                                  AppLocalizations.of(context)!.totalEarnings,
                                  provider.totalEarningsPercentage),
                              bookingTypeIndicator(
                                  "expence",
                                  AppLocalizations.of(context)!
                                      .totalExpenditure,
                                  provider.totalExpenditurePercentage)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TotalEarnings(
                                    // earnings: provider.netProfitOrLoss,
                                    // percentage:
                                    //     provider.totalEarningsPercentage
                                    ),
                              ),
                            );
                          },
                          child: blackcardWithText(
                              AppLocalizations.of(context)!.totalEarnings,
                              "₹ ${profitAndLossModel.totalEarnings}",
                              context),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TotalExpenses(),
                              ),
                            );
                          },
                          child: blackcardWithText(
                              AppLocalizations.of(context)!.totalExpenditure,
                              "₹ ${profitAndLossModel.totalExpenditure}",
                              context),
                        ),
                      ],
                    )
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

Widget blackcardWithText(type, price, context) {
  return Container(
    decoration: BoxDecoration(
        color: pureBlack, borderRadius: BorderRadius.circular(10.0)),
    width: MediaQuery.of(context).size.width * 0.5 - 30,
    height: 120,
    child: Column(
      children: [
        textWidget(type, cWhiteColor, FontWeight.w700, 16.0, false, null, 0.0,
            10.0, 0.0, 20.0),
        textWidget(price, cWhiteColor, FontWeight.w700, 22.0, false, null, 0.0,
            10.0, 0.0, 20.0),
      ],
    ),
  );
}
