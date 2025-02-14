import '../../../../imports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PrivacyPolicyProvider>(
        builder: (context, provider, _) {
          if (provider.privacyPolicyModel != null) {
            return Padding(
              padding: pPagePadding_16,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.privacyPolicy),
                    sizedBoxHeight15,
                    Text(
                      '${'Update on'}: ${provider.privacyPolicyModel!.lastUpdate}',
                      style: tsRegularText,
                    ),
                    sizedBoxHeight10,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          provider.privacyPolicyModel!.content,
                          style: tsRegularTextWithColorGrey,
                        ),
                      ),
                    ),
                    sizedBoxHeight20,
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
