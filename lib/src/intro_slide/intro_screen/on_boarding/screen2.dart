import '../../../../imports.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imgFranchiseOwner),
              sizedBoxHeight20,
              const Text(tBecomeAFranchiseOwner, style: tsLargeTextBold),
              sizedBoxHeight20,
              const Text(
                tEmpowerYourBusiness,
                style: tsMediumTextWithColorDarkGrey,
                textAlign: TextAlign.center,
              ),
              sizedBoxHeight30,
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnBoarding3(),
                    ),
                  );
                },
                child: Text(
                  tSKIP,
                  style: TextStyle(
                    color: cFadeColor,
                  ),
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
                      color: cFadeColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
