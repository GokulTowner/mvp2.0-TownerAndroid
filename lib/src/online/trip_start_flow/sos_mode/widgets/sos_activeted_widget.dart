import '../../../../../imports.dart';

class SOSActivated extends StatelessWidget {
  const SOSActivated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SafeArea(
            child: Column(
              children: [
                const CustomHeader(title: 'SOS Activated'),
                sizedBoxHeight40,
                Image.asset(
                    'assets/images/success.png'), // Replace with your image path
              ],
            ),
          ),
        ),
      ),
    );
  }
}
