import '../../../../imports.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgTimelyPayment), // Replace with your image path
            sizedBoxHeight20,
            const Text(tTimelyPayment, style: tsLargeTextBold),
            sizedBoxHeight20,
            const Text(
              tGenerateOwnInvoice,
              style: tsMediumTextWithColorDarkGrey,
              textAlign: TextAlign.center,
            ),
            sizedBoxHeight30,

            Padding(
              padding: pPagePadding_24,
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteClass.createAccountIntroScreen);
                },
                title: tGETSTARTED,
              ),
            ),
            sizedBoxHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: mMargin_5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cDarkBlack,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  margin: mMargin_5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cDarkBlack,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  margin: mMargin_5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cDarkBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
