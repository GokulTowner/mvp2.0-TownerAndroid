import '../../../../imports.dart';

class BuySubscriptionScreen extends StatelessWidget {
  const BuySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buySubscriptionProviderWatch =
        context.watch<BuySubscriptionProvider>();
    final buySubscriptionProvider = context.read<BuySubscriptionProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPaddingVertical_8,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomHeader(
                  title: AppLocalizations.of(context)!.buysubscriptions),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      buySubscriptionProvider.setTosubscribe();
                    },
                    child:
                        Text(AppLocalizations.of(context)!.subscribeVehicles),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(cDarkBlack),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.subscriptiondetailsscreen);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.history,
                      style: TextStyle(color: cWhiteColor),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight20,
              const Expanded(
                child: AppContainerWidget(),
              ),
              buySubscriptionProviderWatch.toSubscribe == true
                  ? Card(
                      child: Padding(
                        padding: pPagePadding_8,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.totalAmount}:',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Consumer<BuySubscriptionProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                      '₹ ${value.totalAmount}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.green),
                                    );
                                  },
                                )
                              ],
                            ),
                            Divider(
                              color: cLightGrey,
                            ),
                            CustomButton(
                                onTap: () {
                                  int totalAmount =
                                      buySubscriptionProvider.totalAmount;
                                  if (totalAmount == 0) {
                                    flutterToastFailShort(
                                        AppLocalizations.of(context)!
                                            .pleasechooseapackagefromoneoftheavailablevehicles,
                                        14);
                                    return;
                                  }
                                  buySubscriptionProvider
                                      .addSubscriptionRequest();
                                  context
                                      .read<PayingSubscriptionProvider>()
                                      .setTotalAmount(totalAmount);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PayingSubscriptionScreen(
                                          totalAmount: totalAmount,
                                        );
                                      },
                                    ),
                                  );
                                },
                                title: AppLocalizations.of(context)!.proceed),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
