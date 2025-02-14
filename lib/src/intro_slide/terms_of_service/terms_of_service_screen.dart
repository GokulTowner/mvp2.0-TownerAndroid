import '../../../imports.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final termsOfServiceProvider = context.watch<TermsOfServiceProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight10,
              const CustomHeader(title: tTermsOfService),
              sizedBoxHeight10,
              const Padding(
                padding: pPagePadding_16,
                child: Text(tOurTermsOfConditions, style: tsLargeTextBold),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: pPagePadding_16,
                    child: Text(
                      textAlign: TextAlign.justify,
                      tTermsOfServiceDetails,
                      style: tsRegularTextWithColorDeepGrey,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: termsOfServiceProvider.checkBox1,
                    activeColor: cMainGreen,
                    checkColor: cDarkBlack,
                    onChanged: (value) {
                      termsOfServiceProvider.setCheckBoxValue(0);
                    },
                  ),
                  const Text(
                    tIAcceptAllThe,
                    style: tsSmallText,
                  ),
                  const Text(
                    tTermsAndConditions,
                    style: tsSmallTextUnderlineBold,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: termsOfServiceProvider.checkBox2,
                    activeColor: cMainGreen,
                    checkColor: cDarkBlack,
                    onChanged: (value) {
                      termsOfServiceProvider.setCheckBoxValue(1);
                    },
                  ),
                  const Text(
                    tIAcceptAllTheSaaSTechAgreement,
                    style: tsSmallTextUnderlineBold,
                  ),
                ],
              ),
              CustomButton(
                  onTap: () {
                    bool result =
                        termsOfServiceProvider.checkTermsOfServiceAccepted();
                    result == true
                        ? Navigator.pushNamed(
                            context, RouteClass.languageSelectScreen)
                        : const SizedBox();
                  },
                  title: tAccepted),
            ],
          ),
        ),
      ),
    );
  }
}
