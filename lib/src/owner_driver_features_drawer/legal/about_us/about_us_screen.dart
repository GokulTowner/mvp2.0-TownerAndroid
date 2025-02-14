import '../../../../imports.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.aboutUs),
              sizedBoxHeight20,
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<AboutUsProvider>(
                    builder: (context, provider, _) {
                      if (provider.aboutUsDataModel != null) {
                        return _buildAboutUsContent(
                            provider.aboutUsDataModel!, context);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
              sizedBoxHeight20,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutUsContent(
      AboutUsDataModel aboutUsDataModel, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutUsDataModel.title,
          style: tsRegularText,
        ),
        sizedBoxHeight10,
        Text(
          aboutUsDataModel.description,
          style: tsSmallText,
        ),
        sizedBoxHeight20,
        const Text('vision :', style: tsRegularText),
        sizedBoxHeight10,
        Text(
          aboutUsDataModel.vision,
          style: tsRegularTextBold,
        ),
        sizedBoxHeight20,
        const Text('Values :', style: tsRegularText),
        sizedBoxHeight10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: aboutUsDataModel.values
              .map((value) => Text(
                    '- $value',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF676767),
                      height: 1.5,
                    ),
                  ))
              .toList(),
        ),
        sizedBoxHeight20,
        const Text('Contact :', style: tsSmallTextBold),
        sizedBoxHeight10,
        Text(
          'Email : ${aboutUsDataModel.contact.email}\n'
          '${AppLocalizations.of(context)!.mobileNumber}: ${aboutUsDataModel.contact.phone}\n'
          'Address : ${aboutUsDataModel.contact.address}',
          style: tsRegularText,
        ),
      ],
    );
  }
}
