import '../../../../../imports.dart';

class ReviewSuccess extends StatelessWidget {
  const ReviewSuccess({super.key});

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
              Image.asset('assets/images/success.png'),
              const SizedBox(height: 30.0),
              const Text(
                'Thanks for your review,',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              const Text(
                'successfully done',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
