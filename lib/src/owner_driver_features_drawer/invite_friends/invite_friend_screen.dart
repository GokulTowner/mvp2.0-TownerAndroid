import '../../../../imports.dart';

class InviteFriendsPage extends StatelessWidget {
  final String user;

  const InviteFriendsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPagePadding_12,
        child: SafeArea(
          child: Consumer<InviteFriendsProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    title: AppLocalizations.of(context)!.inviteFriends,
                  ),
                  RadioListTile<int>(
                    title: Text(
                      user,
                      style: const TextStyle(fontSize: 22),
                    ),
                    value: 0,
                    groupValue: 0,
                    onChanged: (value) {},
                    activeColor: darkBlack,
                  ),
                  sizedBoxHeight20,
                  Center(
                    child: Text(
                      '${AppLocalizations.of(context)!.ifYouInviteaDriver} Rs. 500 /-',
                      style: const TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  sizedBoxHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'https://referral.oiot.com/',
                        style: TextStyle(fontSize: 16, color: cBlueMain),
                      ),
                      sizedBoxWidth5,
                      const Text(
                        'PRSHKMAR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  sizedBoxHeight50,
                  Row(
                    children: [
                      sizedBoxWidth10,
                      Image.asset(
                        'assets/images/community/google_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sizedBoxWidth20,
                      Text(
                        AppLocalizations.of(context)!.google,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  sizedBoxHeight25,
                  Row(
                    children: [
                      sizedBoxWidth10,
                      Image.asset(
                        'assets/images/community/facebook_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sizedBoxWidth20,
                      Text(
                        AppLocalizations.of(context)!.facebook,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  sizedBoxHeight25,
                  Row(
                    children: [
                      sizedBoxWidth10,
                      Image.asset(
                        'assets/images/community/whatsapp_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sizedBoxWidth20,
                      Text(
                        AppLocalizations.of(context)!.whatsapp,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  sizedBoxHeight25,
                  Row(
                    children: [
                      sizedBoxWidth10,
                      Image.asset(
                        'assets/images/community/linkedin_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sizedBoxWidth20,
                      Text(
                        AppLocalizations.of(context)!.linkedIn,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  sizedBoxHeight25,
                  Row(
                    children: [
                      sizedBoxWidth10,
                      Image.asset(
                        'assets/images/community/telegram_logo.png',
                        height: 30,
                        width: 30,
                      ),
                      sizedBoxWidth20,
                      Text(
                        AppLocalizations.of(context)!.telegram,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context, false);
                      final referFriendsProvider =
                          Provider.of<ReferFriendsProvider>(context,
                              listen: false);
                      final referralCode =
                          referFriendsProvider.referFriendData?.code ?? '';
                      Provider.of<InviteFriendsProvider>(context, listen: false)
                          .shareFunction(referralCode);
                    },
                    title: AppLocalizations.of(context)!.shareNow,
                  ),
                  sizedBoxHeight50,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
