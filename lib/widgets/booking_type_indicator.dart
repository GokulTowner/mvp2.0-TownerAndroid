import '../imports.dart';

Widget bookingTypeIndicator(type, text, String value) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: type == "earning" || type == "cash"
                ? const Color(0xff63C620)
                : bloodRed,
            height: 30,
            width: 30,
          ),
          CustomTextWidget(
            text: ' $value%',
            size: 22,
            color: cDarkBlack,
            weight: FontWeight.bold,
          )
        ],
      ),
      textWidget(text, darkMediumGrey, FontWeight.bold, 14.0, false, null, 0.0,
          0.0, 0.0, 0.0),
    ],
  );
}
