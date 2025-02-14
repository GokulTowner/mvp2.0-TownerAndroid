import '../imports.dart';

class DarkButton extends StatelessWidget {
  final Function onTap;
  final String title;
  const DarkButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cDarkBlack,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
        ),
        onPressed: () => {onTap()},
        child: Text(
          title,
          style: TextStyle(color: cWhiteColor),
        ),
      ),
    );
  }
}
