// ignore_for_file: use_key_in_widget_constructors

import '../../../imports.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.legal),
              sizedBoxHeight30,
              Expanded(
                child: ListView(
                  children: [
                    _buildLegalItem(
                      icon: Icons.assignment,
                      title: AppLocalizations.of(context)!.termsConditions,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TermsAndConditionDrawerScreen(),
                          ),
                        );
                      },
                    ),
                    sizedBoxHeight35,
                    _buildLegalItem(
                      icon: Icons.lock,
                      title: AppLocalizations.of(context)!.privacyPolicy,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                    ),
                    sizedBoxHeight35,
                    _buildLegalItem(
                      icon: Icons.info,
                      title: AppLocalizations.of(context)!.aboutUs,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUs(),
                          ),
                        );
                      },
                    ),
                    sizedBoxHeight35,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegalItem({
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cGreyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: cTextGrey,
              size: 30,
            ),
            sizedBoxWidth15,
            Text(
              title,
              style: tsRegularText,
            ),
          ],
        ),
      ),
    );
  }
}
