import '../imports.dart';

class GreenButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? width;
  final Color? color;
  final Color? textColor;
  final IconData? icon;

  const GreenButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.width,
      this.color,
      this.textColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? cMainGreen,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
            ),
            onPressed: () => {onTap()},
            child: Row(
              children: [
                CustomTextWidget(
                  text: title,
                  size: 14.0,
                  color: textColor ?? cDarkBlack,
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  icon,
                  color: Colors.amber,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
