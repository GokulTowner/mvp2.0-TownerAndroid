import '../../../../../imports.dart';

Widget customCard(number, price, status, date) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: cLightGrey,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.arrow_upward),
            CustomTextWidget(
                text: number,
                size: 14,
                color: cDarkBlack,
                weight: FontWeight.bold),
            CustomTextWidget(
                text: price,
                size: 14,
                color: cDarkBlack,
                weight: FontWeight.bold),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
                text: status,
                size: 14,
                color: status == 'Failed' ? cBloodRed : Colors.green,
                weight: FontWeight.w700),
            CustomTextWidget(
                text: date,
                size: 14,
                color: cDarkBlack,
                weight: FontWeight.w400),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text('Purpose  :'), Text('Add Money')],
        )
      ],
    ),
  );
}
