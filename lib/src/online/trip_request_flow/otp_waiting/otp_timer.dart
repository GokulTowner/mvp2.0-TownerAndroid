import '../../../../imports.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final timerController = Provider.of<CountdownTimerController>(context);

    return Container(
      decoration: BoxDecoration(
        color: cDarkBlack,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          '${timerController.getFormattedTime()} Time left',
          style: TextStyle(
            color: cMainGreen,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
