import '../../../imports.dart';

class IndroScreen extends StatelessWidget {
  const IndroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final swipeProvider = Provider.of<IntroProvider>(context, listen: false);
    return Scaffold(
      body: PageView(
        controller: swipeProvider.pageController,
        physics: const ClampingScrollPhysics(), // Disable bouncing effect
        children: const [
          OnBoarding1(),
          OnBoarding2(),
          OnBoarding3(),
        ],
      ),
    );
  }
}
