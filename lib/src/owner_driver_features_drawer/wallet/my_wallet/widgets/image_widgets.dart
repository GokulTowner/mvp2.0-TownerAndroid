import '../../../../../imports.dart';

Widget imageWidget(image, text, onTap) {
  return Column(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cWhiteColor,
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 10.0, vertical: 20.0),
          side: BorderSide(color: cBorderGrey),
        ),
        onPressed: () {
          onTap();
        },
        child: image,
      ),
      const SizedBox(
        height: 10.0,
      ),
      CustomTextWidget(
          text: text, size: 14, color: cDarkBlack, weight: FontWeight.bold),
    ],
  );
}
