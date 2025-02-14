import '../imports.dart';

class AppUploadDataCustomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? textSize;
  final double? optionalHeight;
  final Color? optionalColor;
  final Color? optionalTextColor;
  const AppUploadDataCustomButton(
      {required this.onTap,
      required this.title,
      this.textSize,
      this.optionalHeight,
      this.optionalColor,
      this.optionalTextColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: optionalHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(cLightGrey),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              // side: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 43)),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: cTextDarkGrey,
            fontSize: textSize ?? 15,
          ),
        ),
      ),
    );
  }
}
