import '../../../../imports.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imgNoCommission),
              sizedBoxHeight20,
              const Text(
                tNOCOMMISSION,
                style: tsLargeTextBold,
              ),
              sizedBoxHeight20,
              const Text(
                tFreedonFromCommission,
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
                      color: cFadeColor,
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
