import '../../../../imports.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Consumer<ContactUsController>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.contactUs),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.logoItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: pPagePadding_12,
                          child: LogoListItem(
                            logoItem: provider.logoItems[index],
                            function: () {
                              if (index == 0) {
                                provider.sendFeedbackEmail();
                              } else if (index == 1) {
                                provider.launchWebsiteURL();
                              } else if (index == 2) {
                                provider.whatsappUrl();
                              } else if (index == 3) {
                                provider.callFunction();
                              } else if (index == 4) {
                                provider.textMessage();
                              } else if (index == 5) {
                                Navigator.pushNamed(
                                    context, RouteClass.tickethistorscreen);
                              }
                            },
                          ),
                        );
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
