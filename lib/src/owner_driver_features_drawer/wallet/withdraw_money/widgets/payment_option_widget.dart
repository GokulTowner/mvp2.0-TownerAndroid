import '../../../../../imports.dart';

Widget paymentOption(img, title, desc) {
  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Container(
      decoration: BoxDecoration(
        color: img == 'assets/bank.png' ? cMainGreen : cLightGrey,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      margin: const EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage(img),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(title, pureBlack, FontWeight.bold, 20.0, false, null,
                    0.0, 0.0, 0.0, 0.0),
                textWidget(desc, pureBlack, FontWeight.w200, 16.0, false, null,
                    0.0, 0.0, 0.0, 0.0)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
