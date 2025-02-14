import '../../../../imports.dart';

class DrawerRowWidget extends StatelessWidget {
  final IconData? icon;
  final String? subtitle;
  final Function onPressed;
  final String text;
  const DrawerRowWidget(
      {super.key,
      this.icon,
      required this.text,
      this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(
              icon,
              color: cDarkBlack,
              size: 26,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            text,
            style: tsSmallText,
          ),
          const Spacer(),
          Text(subtitle ?? '', style: tsExtraSmallTextGrey),
          sizedBoxWidth10
        ],
      ),
    );
  }
}
