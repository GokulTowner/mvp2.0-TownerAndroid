import '../../../../../imports.dart';

class BonusScreen extends StatelessWidget {
  const BonusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomHeader(title: AppLocalizations.of(context)!.bonus),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        imageWidget(
                          const Image(
                            image: AssetImage(imgWelcomeBonus),
                          ),
                          AppLocalizations.of(context)!.welcomeBonus,
                          () {
                            // Navigator.pop(context, 1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BonusListScreen(flag: 1),
                              ),
                            );
                          },
                        ),
                        imageWidget(
                          const Image(
                            image: AssetImage(imgReferralBonus),
                          ),
                          AppLocalizations.of(context)!.referrlaBonus,
                          () {
                            // Navigator.pop(context, 2);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BonusListScreen(flag: 2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        imageWidget(
                            const Image(
                              image: AssetImage(imgCouponBonus),
                            ),
                            AppLocalizations.of(context)!.couponBonus, () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BonusListScreen(flag: 3),
                            ),
                          );
                          // Navigator.pop(context, 3);
                        }),
                        imageWidget(
                          const Image(
                            image: AssetImage(imgSubscription),
                          ),
                          AppLocalizations.of(context)!.subscriptionBonus,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BonusListScreen(flag: 4),
                              ),
                            );

                            // Navigator.pop(context, 4);
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        imageWidget(
                          const Image(
                            image: AssetImage(imgWalletBonus),
                          ),
                          AppLocalizations.of(context)!.walletBonus,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BonusListScreen(flag: 5),
                              ),
                            );

                            // Navigator.pop(context, 5);
                          },
                        ),
                        imageWidget(
                          const Image(
                            image: AssetImage(imgPerformanceBonus),
                          ),
                          AppLocalizations.of(context)!.performanceBonus,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BonusListScreen(flag: 6),
                              ),
                            );
                            // Navigator.pop(context, 6);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
