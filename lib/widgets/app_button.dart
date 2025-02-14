import '../imports.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? textSize;
  final double? optionalHeight;
  final Color? optionalColor;
  final Color? optionalTextColor;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.textSize,
      this.optionalHeight,
      this.optionalColor,
      this.optionalTextColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: optionalHeight,
      child: Material(
        color: (optionalColor) != null ? optionalColor : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(5),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (optionalTextColor) != null
                    ? optionalTextColor
                    : cMainGreen,
                fontSize: textSize ?? 18),
          ),
        ),
      ),
    );
  }
}
