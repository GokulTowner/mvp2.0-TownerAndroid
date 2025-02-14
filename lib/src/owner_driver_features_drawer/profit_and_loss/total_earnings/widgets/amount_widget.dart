import '../../../../../imports.dart';

class TransactionDetailWidget extends StatelessWidget {
  final String transId;
  final String transAmount;
  final String dateAndTime;
  final String gst;
  final String status;
  const TransactionDetailWidget(
      {required this.transId,
      required this.transAmount,
      required this.dateAndTime,
      required this.gst,
      required this.status,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: cLightGrey,
      child: Padding(
        padding: pPagePadding_8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                    text: transId,
                    size: 16,
                    color: cDarkBlack,
                    weight: FontWeight.bold),
                CustomTextWidget(
                    text: transAmount,
                    size: 17,
                    color: cDarkBlack,
                    weight: FontWeight.bold),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                    text: dateAndTime,
                    size: 13,
                    color: cDarkBlack,
                    weight: FontWeight.w500),
                CustomTextWidget(
                    text: gst,
                    size: 17,
                    color: cDarkBlack,
                    weight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                    text: status,
                    size: 13,
                    color: cDarkBlack,
                    weight: FontWeight.w500),
                textWidget("Trip income", cTextGrey, FontWeight.w500, 13.0,
                    false, null, 0.0, 0.0, 0.0, 0.0),
                Text(
                  AppLocalizations.of(context)!.viewDetails,
                  style: TextStyle(
                    color: cDarkBlack,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
