import '../../../../imports.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreen();
}

class _TermsAndConditionsScreen extends State<TermsAndConditionsScreen> {
  bool _checkBox1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight20,
              const CustomHeader(title: 'Service Agreement'),
              sizedBoxHeight30,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Saas Technology contract',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ),
              sizedBoxHeight10,
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.\n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.\n\nVarious versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF676767),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _checkBox1,
                    activeColor: cBackgroundGreen,
                    checkColor: cDarkBlack,
                    onChanged: (value) {
                      setState(
                        () {
                          _checkBox1 = !_checkBox1;
                        },
                      );
                    },
                  ),
                  const Text(
                    'I accept all the SaaS Tech Agreement',
                    style: TextStyle(
                        fontSize: 15, decoration: TextDecoration.underline),
                  ),
                ],
              ),
              CustomButton(
                  onTap: () {
                    if (_checkBox1) {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RouteClass.landingScreenOwner, (route) => false);
                    }
                  },
                  title: 'Accepted'),
            ],
          ),
        ),
      ),
    );
  }
}
