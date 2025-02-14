import 'dart:developer';
import '../../../../imports.dart';

class BonusListScreen extends StatelessWidget {
  final int flag;
  const BonusListScreen({required this.flag, super.key});

  @override
  Widget build(BuildContext context) {
    BonusProvider(flag: flag);
    return ChangeNotifierProvider(
      create: (context) => BonusProvider(flag: flag),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<BonusProvider>(
            builder: (context, provider, child) {
              List<WelcomeBonusModel> welcomeBonusList = [];
              List<ReferralBonusModel> referralBonusList = [];
              List<CouponBonusModel> couponBonusList = [];
              List<SubscriptionBonusModel> subscriptionBonusList = [];
              List<WalletBounsModel> walletBonusList = [];
              List<PerformanceBonusModel> performanceBonusList = [];
              if (flag == 1) {
                welcomeBonusList = provider.welcomeBonusList;
              } else if (flag == 2) {
                referralBonusList = provider.referralBonusList;
              } else if (flag == 3) {
                couponBonusList = provider.couponBonusList;
              } else if (flag == 4) {
                subscriptionBonusList = provider.subscriptionBonusList;
              } else if (flag == 5) {
                walletBonusList = provider.walletBonusList;
              } else if (flag == 6) {
                performanceBonusList = provider.performanceBonusList;
              } else {
                return const SizedBox();
              }

              log('welcomebonus : ${welcomeBonusList.length}');

              return Column(
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.welcomeBonus),
                  Expanded(
                    child: ListView.builder(
                      itemCount: flag == 1
                          ? welcomeBonusList.length
                          : flag == 2
                              ? referralBonusList.length
                              : flag == 3
                                  ? couponBonusList.length
                                  : flag == 4
                                      ? subscriptionBonusList.length
                                      : flag == 5
                                          ? walletBonusList.length
                                          : flag == 6
                                              ? performanceBonusList.length
                                              : 0,
                      itemBuilder: (BuildContext context, int index) {
                        WelcomeBonusModel welcomeBonus = WelcomeBonusModel(
                            bonusId: 'N/A',
                            bonusName: 'N/A',
                            bonusAmount: 0,
                            description: 'N/A',
                            status: 'N/A',
                            dateTime: 'N/A');
                        ReferralBonusModel referralBonus = ReferralBonusModel(
                            bonusId: 'N/A',
                            bonusName: 'N/A',
                            bonusAmount: 0,
                            description: 'N/A',
                            status: 'N/A',
                            dateTime: 'N/A');

                        CouponBonusModel couponBonus = CouponBonusModel(
                            bonusId: 'N/A',
                            bonusName: 'N/A',
                            bonusAmount: 0,
                            description: 'N/A',
                            status: 'N/A',
                            dateTime: 'N/A');
                        SubscriptionBonusModel subscriptionBonus =
                            SubscriptionBonusModel(
                                bonusId: 'N/A',
                                bonusName: 'N/A',
                                bonusAmount: 0,
                                description: 'N/A',
                                status: 'N/A',
                                dateTime: 'N/A');
                        WalletBounsModel walletBonus = WalletBounsModel(
                            bonusId: 'N/A',
                            bonusName: 'N/A',
                            bonusAmount: 0,
                            description: 'N/A',
                            status: 'N/A',
                            dateTime: 'N/A');
                        PerformanceBonusModel performanceBonus =
                            PerformanceBonusModel(
                                bonusId: 'N/A',
                                bonusName: 'N/A',
                                bonusAmount: 0,
                                description: 'N/A',
                                status: 'N/A',
                                dateTime: 'N/A');

                        if (flag == 1) {
                          welcomeBonus = welcomeBonusList[index];
                        } else if (flag == 2) {
                          referralBonus = referralBonusList[index];
                        } else if (flag == 3) {
                          couponBonus = couponBonusList[index];
                        } else if (flag == 4) {
                          subscriptionBonus = subscriptionBonusList[index];
                        } else if (flag == 5) {
                          walletBonus = walletBonusList[index];
                        } else if (flag == 6) {
                          performanceBonus = performanceBonusList[index];
                        }

                        return flag == 1
                            ? listTileWidgetBonus(
                                leadingImage: imgWelcomeBonus,
                                title:
                                    '${AppLocalizations.of(context)!.amount} : ${welcomeBonus.bonusAmount}',
                                subtitle: welcomeBonus.bonusName,
                                trailingTitle: 'Id : ${welcomeBonus.bonusId}',
                                trailingIcon: Icons.arrow_forward_ios,
                                dateTime: welcomeBonus.dateTime,
                                status: welcomeBonus.status,
                              )
                            : flag == 2
                                ? listTileWidgetBonus(
                                    leadingImage: imgReferralBonus,
                                    title:
                                        '${AppLocalizations.of(context)!.amount} : ${referralBonus.bonusAmount}',
                                    subtitle: referralBonus.bonusName,
                                    trailingTitle:
                                        'Id : ${referralBonus.bonusId}',
                                    trailingIcon: Icons.arrow_forward_ios,
                                    dateTime: referralBonus.dateTime,
                                    status: referralBonus.status,
                                  )
                                : flag == 3
                                    ? listTileWidgetBonus(
                                        leadingImage: imgCouponBonus,
                                        title:
                                            '${AppLocalizations.of(context)!.amount} : ${couponBonus.bonusAmount}',
                                        subtitle: couponBonus.bonusName,
                                        trailingTitle:
                                            'Id : ${couponBonus.bonusId}',
                                        trailingIcon: Icons.arrow_forward_ios,
                                        dateTime: couponBonus.dateTime,
                                        status: couponBonus.status,
                                      )
                                    : flag == 4
                                        ? listTileWidgetBonus(
                                            leadingImage: imgSubscription,
                                            title:
                                                '${AppLocalizations.of(context)!.amount} : ${subscriptionBonus.bonusAmount}',
                                            subtitle:
                                                subscriptionBonus.bonusName,
                                            trailingTitle:
                                                'Id : ${subscriptionBonus.bonusId}',
                                            trailingIcon:
                                                Icons.arrow_forward_ios,
                                            dateTime:
                                                subscriptionBonus.dateTime,
                                            status: subscriptionBonus.status,
                                          )
                                        : flag == 5
                                            ? listTileWidgetBonus(
                                                leadingImage: imgWalletBonus,
                                                title:
                                                    '${AppLocalizations.of(context)!.amount} : ${walletBonus.bonusAmount}',
                                                subtitle: walletBonus.bonusName,
                                                trailingTitle:
                                                    'Id : ${walletBonus.bonusId}',
                                                trailingIcon:
                                                    Icons.arrow_forward_ios,
                                                dateTime: walletBonus.dateTime,
                                                status: walletBonus.status,
                                              )
                                            : flag == 6
                                                ? listTileWidgetBonus(
                                                    leadingImage:
                                                        imgPerformanceBonus,
                                                    title:
                                                        '${AppLocalizations.of(context)!.amount} : ${performanceBonus.bonusAmount}',
                                                    subtitle: performanceBonus
                                                        .bonusName,
                                                    trailingTitle:
                                                        'Id : ${performanceBonus.bonusId}',
                                                    trailingIcon:
                                                        Icons.arrow_forward_ios,
                                                    dateTime: performanceBonus
                                                        .dateTime,
                                                    status:
                                                        performanceBonus.status,
                                                  )
                                                : const SizedBox();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
