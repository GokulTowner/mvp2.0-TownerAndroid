import '../../../../../imports.dart';

class TermsAndConditionDrawerScreen extends StatelessWidget {
  const TermsAndConditionDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.termsConditions),
      ),
      body: Consumer<TermsAndServicesProvider>(
        builder: (context, provider, _) {
          if (provider.termsAndConditionsModel != null) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Terms of Conditions',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        provider.termsAndConditionsModel!.content,
                        style: const TextStyle(fontSize: 16, height: 1.7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Accepted on: ${provider.termsAndConditionsModel!.acceptedDateTime}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Location: ${provider.termsAndConditionsModel!.acceptedLocation}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
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
