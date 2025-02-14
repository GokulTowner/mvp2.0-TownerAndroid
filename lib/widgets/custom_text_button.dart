import '../imports.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback callBack;
  final Color textColor;
  final double border;
  final Color borderColor;
  final double fontSize;
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.color,
      required this.callBack,
      required this.textColor,
      required this.border,
      required this.fontSize,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: border),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Center(
          child: CustomTextWidget(
            text: text,
            size: fontSize,
            color: textColor,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
