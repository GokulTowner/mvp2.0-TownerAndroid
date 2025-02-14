import '../../../imports.dart';

class GoogleCommunity extends StatelessWidget {
  const GoogleCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPagePadding_14,
        child: SafeArea(
          child: Column(
            children: [
              CustomHeader(
                title: AppLocalizations.of(context)!.google,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.googleDuo,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_duo_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.googleMaps,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_map_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.reviews,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/reviews_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.googleShops,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_shops_logo.png',
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
                            name: AppLocalizations.of(context)!.googleClassroom,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_classroom_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.blogger,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/blogger_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: AppLocalizations.of(context)!.googlePodcast,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assets/images/community/google_podcast_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  const Icon(
                    Icons.circle_outlined,
                    color: Colors.transparent,
                    size: 50,
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
