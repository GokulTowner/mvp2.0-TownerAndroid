import '../../../../../imports.dart';

class CongratsPopup extends StatelessWidget {
  final int rupee;
  const CongratsPopup({
    super.key,
    required this.rupee,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.57,
      widthFactor: 1.1, // Adjust the height as per your requirement
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(imgVerificationBehind),
                  Center(
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        color: cDarkBlack,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹${rupee.toString()}',
                              style: TextStyle(
                                color: cBackgroundGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 55.0,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.bonus,
                              style: TextStyle(
                                color: cMainGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(AppLocalizations.of(context)!.congratulations,
                  style: tsExLargeTextBold),
              sizedBoxHeight20,
              Text(
                '${AppLocalizations.of(context)!.walletSuccessMessage} ₹${rupee.toString()} ${AppLocalizations.of(context)!.walletSuccessMessageRemaining}',
                style: const TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    height: 1.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
