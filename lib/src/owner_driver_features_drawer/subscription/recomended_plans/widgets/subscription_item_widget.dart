import '../../../../../imports.dart';

class SubscriptionItemWidget extends StatelessWidget {
  final String vehId;
  const SubscriptionItemWidget({required this.vehId, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Consumer<RecommentedPlansProvider>(
        builder: (context, provider, child) {
          List<RecommentedPlansModel> plans = provider.recommentedPlans;
          return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              RecommentedPlansModel subscriptionPlan = plans[index];
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: height * 0.18,
                    width: width * 0.9,
                    color: cBackgroundWhite,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 17, bottom: 20, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                subscriptionPlan.planName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                subscriptionPlan.subAmount,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: cSuccessGreen),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            subscriptionPlan.description,
                            style: TextStyle(color: cTextDarkGrey),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet<dynamic>(
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      bool isOwner = Provider.of<LoginProvider>(
                                              context,
                                              listen: false)
                                          .isOwner;
                                      return isOwner
                                          ? BottomSlidingOwnerPopup(
                                              vehId: vehId,
                                              planId: subscriptionPlan.planId,
                                              benifits:
                                                  subscriptionPlan.subBenefits,
                                              planName:
                                                  subscriptionPlan.planName,
                                              planAmount:
                                                  subscriptionPlan.subAmount,
                                              validity:
                                                  subscriptionPlan.validity,
                                            )
                                          : const SizedBox();
                                      // const BottomSlidingDriverPopup();
                                    },
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.viewDetails,
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: cDarkBlack, elevation: 0),
                                onPressed: () {
                                  provider.addSubscription(
                                      vehId,
                                      subscriptionPlan.planId,
                                      subscriptionPlan.subAmount);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PayingSubscriptionScreen(
                                        totalAmount: int.parse(
                                            subscriptionPlan.subAmount),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.buyNow,
                                  style: TextStyle(color: cMainGreen),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
