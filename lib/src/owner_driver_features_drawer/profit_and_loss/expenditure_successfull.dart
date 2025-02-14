import '../../../imports.dart';

class ExpenditureSuccessful extends StatelessWidget {
  const ExpenditureSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cWhiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: CustomTextWidget(
            text: "Successful",
            size: 16.0,
            color: cDarkBlack,
            weight: FontWeight.bold),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SafeArea(
            child: Column(
              children: [
                sizedBoxHeight40,
                Image.asset(
                    'assets/images/success.png'), // Replace with your image path
                sizedBoxHeight35,
                const Text(
                  'successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                sizedBoxHeight50,
                const Text(
                  'Your new expenditure has been\n added successfully',
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xFF676767),
                  ),
                  textAlign: TextAlign.center,
                ),
                sizedBoxHeight20,
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const More(),
                          ),
                        );
                      },
                      title: 'Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
