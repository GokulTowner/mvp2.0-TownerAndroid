import '../../../imports.dart';

class CommunityMainScreen extends StatelessWidget {
  const CommunityMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPagePadding_14,
        child: SafeArea(
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.ourCommunity),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GoogleCommunity(),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  //============== Facebook logo=======================================
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityGroups(
                              name: AppLocalizations.of(context)!
                                  .connectWithfCommunity,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                          'assets/images/community/facebook_logo.png',
                          width: 50.0,
                          height: 50.0)),
                  //============== Whatsapp logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.whatsApp,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/whatsapp_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  //============== Linkedin logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.linkedIn,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/linkedin_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  //============== Telegaram logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.telegram,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/telegram_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                ],
              ),
              sizedBoxHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.googleMeet,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_meet_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.clubHouse,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/clubhouse_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.youTube,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/youtube_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.koo,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/images/community/koo_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.playStore,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/play_store_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.mouthShut,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/mouthshut_logo.png',
                        width: 100.0,
                        height: 100.0),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.justDial,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/just_dial_logo.png',
                        width: 100.0,
                        height: 100.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/community/chingari_logo.png',
                      width: 50.0, height: 50.0),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset('assets/images/community/josh_logo.png',
                      width: 50.0, height: 50.0),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset('assets/images/community/share_chat_logo.png',
                      width: 50.0, height: 50.0),
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset('assets/images/community/yellow_pages_logo.png',
                      width: 60.0, height: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/community/snapdragon_logo.png',
                      width: 50.0, height: 50.0),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "",
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/quikr_logo_com.png',
                        width: 120,
                        height: 120),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
