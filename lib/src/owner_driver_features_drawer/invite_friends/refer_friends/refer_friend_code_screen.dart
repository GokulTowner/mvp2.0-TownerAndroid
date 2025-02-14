import '../../../../imports.dart';

class ReferFriendCodeScreen extends StatelessWidget {
  const ReferFriendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReferFriendsProvider referFriendsProvider =
        Provider.of<ReferFriendsProvider>(context, listen: false);
    final referFriendsProviderWatch = context.watch<ReferFriendsProvider>();
    return Scaffold(
      body: Padding(
        padding: pPagePadding_16,
        child: SafeArea(
          child: Consumer<ReferFriendsProvider>(
            builder: (context, provider, child) {
              ReferFriendsModel? referCodeData = provider.referFriendData;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomHeader(
                          title: AppLocalizations.of(context)!.referFriends),
                      Card(
                        color: cWhiteColor,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ReferHistoryScreen(),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.history,
                            style: tsRegularText,
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight20,
                  Image.asset(
                    imgReferralProgram,
                    height: 230,
                    width: 230,
                  ),
                  sizedBoxHeight30,
                  Text(
                    AppLocalizations.of(context)!.shareFollowingCode,
                    style: tsLargeTextBold,
                  ),
                  sizedBoxHeight30,
                  Container(
                    width: double.infinity,
                    padding: pPaddingVertical_10,
                    decoration: BoxDecoration(
                      color: cGreyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Center(
                        child: Text(
                          referCodeData?.code.split('').join(' ') ?? '',
                          style: tsLargeTextBold,
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text(
                            AppLocalizations.of(context)!.driver,
                          ),
                          value: 1,
                          activeColor: cDarkBlack,
                          groupValue: referFriendsProviderWatch
                              .selectedButtonDriverorRider,
                          onChanged: (value) {
                            referFriendsProvider
                                .selectedButtonIndCorpFunction(value!);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          title: Text(
                            AppLocalizations.of(context)!.rider,
                          ),
                          value: 2,
                          activeColor: cDarkBlack,
                          groupValue: referFriendsProviderWatch
                              .selectedButtonDriverorRider,
                          onChanged: (value) {
                            referFriendsProvider
                                .selectedButtonIndCorpFunction(value!);
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight30,
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteFriendsPage(
                            user: referFriendsProvider
                                        .selectedButtonDriverorRider ==
                                    1
                                ? AppLocalizations.of(context)!.driver
                                : AppLocalizations.of(context)!.rider,
                          ),
                        ),
                      );
                    },
                    title: AppLocalizations.of(context)!.next,
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
