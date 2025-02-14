import '../../../../../imports.dart';

class TownerContainerWidget extends StatelessWidget {
  final int? totalAmount;
  const TownerContainerWidget({this.totalAmount, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cMainGreen,
      height: 120,
      child: Row(
        children: [
          Image.asset(
            imgLogo2,
            fit: BoxFit.fitHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight10,
              Text(AppLocalizations.of(context)!.towner, style: tsMediumText),
              sizedBoxHeight10,
              Text(AppLocalizations.of(context)!.hybridTaxiSolution,
                  style: tsSmallTextBold),
              sizedBoxHeight10,
              totalAmount == null
                  ? const Text('0')
                  : Text('₹ ${totalAmount.toString()}', style: tsLargeText)
            ],
          )
        ],
      ),
    );
  }
}
