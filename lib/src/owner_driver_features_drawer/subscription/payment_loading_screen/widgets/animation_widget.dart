import 'dart:math';
import '../../../../../imports.dart';

class StepIndicator extends StatefulWidget {
  const StepIndicator({super.key});

  @override
  State<StepIndicator> createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
          begin: 0, end: 30), // Set the end value to your desired step
      duration: const Duration(seconds: 3), // Animation duration
      builder: (BuildContext context, double value, Widget? qChild) {
        return Stack(children: [
          CircularStepProgressIndicator(
            totalSteps: 40,
            currentStep: value
                .toInt(), // Update the current step based on the animation value
            stepSize: 20,
            selectedColor: cMainGreen,
            unselectedColor: Colors.grey.shade200,
            padding: pi / 80,
            width: 210,
            height: 210,
            startingAngle: 0,
            arcSize: pi * 2,
          ),
          Positioned.fill(
            child: Center(
              child: CustomTextWidget(
                text: '75%',
                size: 40.0,
                color: cDarkBlack,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ]);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
