import '../imports.dart';

class BonusPopup extends StatelessWidget {
  final int rupee;
  const BonusPopup({
    super.key,
    required this.rupee,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.5,
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
                        color: cBlueMain,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹${rupee.toString()}',
                              style: TextStyle(
                                color: cWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 55.0,
                              ),
                            ),
                            Text(
                              'Bonus',
                              style: TextStyle(
                                color: cWhiteColor,
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
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Your referral bonus of ₹${rupee.toString()} has been\n added to your wallet',
                style: const TextStyle(
                  color: Color(0xFF676767),
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
