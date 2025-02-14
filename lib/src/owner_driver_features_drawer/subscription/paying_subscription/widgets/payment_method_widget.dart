import '../../../../../imports.dart';

class PaymentMethodWidget extends StatelessWidget {
  final dynamic image;
  final String? title;
  final String? subTitle;
  const PaymentMethodWidget({this.title, this.subTitle, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        color: cBackgroundWhite,
        child: Padding(
          padding: pPagePadding_8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                alignment: Alignment.center,
                image: AssetImage(image),
              ),
              const SizedBox(
                width: 19,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: cDarkBlack,
                    ),
                  ),
                  Text(
                    subTitle!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: cTextGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
