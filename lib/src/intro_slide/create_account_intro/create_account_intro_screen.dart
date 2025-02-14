import '../../../imports.dart';

class CreateAccountIntroScreen extends StatelessWidget {
  const CreateAccountIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final createAccountPageProvider =
        context.watch<CreateAccountPageProvider>();
    // bool checkBoxState = false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(title: tCreateaAccount),
              sizedBoxHeight30,
              const Text(tHello, style: tsExLargeTextBold),
              sizedBoxHeight30,
              const Text(tSubscribeOur, style: tsExLargeText),
              const Text(tTechnology, style: tsExLargeTextBold),
              sizedBoxHeight30,
              const Text(tBuildYour, style: tsExLargeText),
              const Text(tBusiness, style: tsExLargeTextBold),
              sizedBoxHeight20,
              Row(
                children: [
                  Checkbox(
                    value: createAccountPageProvider.checkBoxStatus,
                    activeColor: cMainGreen,
                    checkColor: cDarkBlack,
                    onChanged: (value) {
                      createAccountPageProvider.setCheckBoxValue();
                    },
                  ),
                  const Text(tBusiness, style: tsSmallText),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteClass.termsOfServiceScreen);
                    },
                    child: const Text(
                      tTermsAndConditions,
                      style: tsSmallTextUnderlineBold,
                    ),
                  ),
                ],
              ),
              sizedBoxHeight20,
              const Spacer(),
              CustomButton(
                onTap: () {
                  if (createAccountPageProvider.checkBoxStatus) {
                    Navigator.pushNamed(
                        context, RouteClass.languageSelectScreen);
                  } else {
                    flutterToastFailLong(tPleaseAcceptTheTermsAndCondition,
                        flutterToastFailFontSize);
                  }
                },
                title: tStartNow,
              ),
              sizedBoxHeight20,
            ],
          ),
        ),
      ),
    );
  }
}
