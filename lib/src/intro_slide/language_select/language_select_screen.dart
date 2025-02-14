import 'package:townerapp/imports.dart';

class LanguageSelectScreen extends StatelessWidget {
  LanguageSelectScreen({super.key});
  final LanguageSelectProvider languageSelectProvider =
      LanguageSelectProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight20,
              const Text(tChooseYour, style: tsLargeTextBold),
              sizedBoxHeight10,
              const Text(tPreferredLanguage, style: tsLargeTextBold),
              sizedBoxHeight40,
              const CustomDropdownButtonLanguage(),
              sizedBoxHeight30,
              const CustomDropdownButtonState(),
              sizedBoxHeight30,
              const CustomDropdownButtonCity(),
              sizedBoxHeight30,
              const Spacer(),
              CustomButton(
                onTap: () {
                  context.read<LanguageSelectProvider>().setIsFirst();
                  Navigator.pushNamedAndRemoveUntil(context,
                      RouteClass.ownerDriverSelectionScreen, (route) => false);
                },
                title: tProceed,
              ),
              sizedBoxHeight20
            ],
          ),
        ),
      ),
    );
  }
}
