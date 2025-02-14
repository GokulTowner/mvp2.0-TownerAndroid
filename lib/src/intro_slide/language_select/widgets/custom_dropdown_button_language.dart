import '../../../../imports.dart';

class CustomDropdownButtonLanguage extends StatelessWidget {
  const CustomDropdownButtonLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsControllerWatch = context.watch<SystemSettingsController>();
    final settingsController =
        Provider.of<SystemSettingsController>(context, listen: false);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.075,
      width: width * 0.94,
      decoration: BoxDecoration(
          color: cDropdownColor, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(right: pPadding_16, left: pPadding_16),
        child: Center(
          child: DropdownButton<Locale>(
            elevation: 5,
            isExpanded: true,
            value: settingsControllerWatch.language,
            onChanged: (value) {
              settingsController.updateLanguage(value);
            },
            borderRadius: BorderRadius.circular(10),
            dropdownColor: cDropdownColor,
            underline: Container(
              height: 0,
              color: cTransparent,
            ),
            items: const [
              DropdownMenuItem(
                value: Locale(lcEn),
                child: Text(tEnglish, style: tsRegularTextWithColorGrey),
              ),
              DropdownMenuItem(
                value: Locale(lcTe),
                child: Text(tTelugu, style: tsRegularTextWithColorGrey),
              ),
              DropdownMenuItem(
                value: Locale(lcKn),
                child: Text(tKannada, style: tsRegularTextWithColorGrey),
              ),
              DropdownMenuItem(
                value: Locale(lcMr),
                child: Text(tMarathi, style: tsRegularTextWithColorGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
