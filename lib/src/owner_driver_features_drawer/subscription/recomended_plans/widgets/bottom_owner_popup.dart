import '../../../../../imports.dart';

class BottomSlidingOwnerPopup extends StatelessWidget {
  final List<String>? benifits;
  final String vehId;
  final String planId;
  final String planName;
  final String planAmount;
  final String validity;
  const BottomSlidingOwnerPopup(
      {this.benifits,
      required this.vehId,
      required this.planId,
      required this.planName,
      required this.planAmount,
      required this.validity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 700,
        child: Scaffold(
          backgroundColor: cWhiteColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: planName,
                      size: 20.0,
                      color: cTextGrey,
                      weight: FontWeight.w700,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 50,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomTextWidget(
                    text: planAmount,
                    size: 40.0,
                    color: cBackgroundGreen,
                    weight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: cGreyColor,
                  height: 5,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: AppLocalizations.of(context)!.validity,
                        size: 16.0,
                        color: cTextGrey,
                        weight: FontWeight.w500,
                      ),
                      CustomTextWidget(
                        text:
                            ' $validity ${AppLocalizations.of(context)!.days}',
                        size: 16.0,
                        color: cTextGrey,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                CustomTextWidget(
                  text: AppLocalizations.of(context)!.subscriptionsBenefits,
                  size: 25.0,
                  color: cDarkBlack,
                  weight: FontWeight.bold,
                ),
                // ignore: unused_local_variable
                const SizedBox(
                  height: 30.0,
                ),
                benifits != null
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: benifits!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    text:
                                        '${AppLocalizations.of(context)!.benits} ${index + 1}',
                                    size: 16.0,
                                    color: cTextGrey,
                                    weight: FontWeight.bold,
                                  ),
                                  CustomTextWidget(
                                    text: benifits![index],
                                    size: 16.0,
                                    color: cTextGrey,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(
                        height: 10.0,
                      ),
                CustomTextButton(
                  text: AppLocalizations.of(context)!.subscribeNow,
                  color: cDarkBlack,
                  callBack: () {
                    context
                        .read<RecommentedPlansProvider>()
                        .addSubscription(vehId, planId, planAmount);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayingSubscriptionScreen(
                            totalAmount: int.parse(planAmount)),
                      ),
                    );
                  },
                  textColor: cMainGreen,
                  border: 0.0,
                  fontSize: 16.0,
                  borderColor: cWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
