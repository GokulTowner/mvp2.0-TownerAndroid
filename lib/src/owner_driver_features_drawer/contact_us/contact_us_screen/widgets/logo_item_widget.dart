import '../../../../../imports.dart';

class LogoListItem extends StatelessWidget {
  final LogoItem logoItem;
  final VoidCallback? function;

  const LogoListItem({
    super.key,
    required this.logoItem,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Container(
        padding: pPagePadding_10,
        child: Row(
          children: [
            Image.asset(
              logoItem.imagePath,
              width: 30.0,
              height: 30.0,
            ),
            sizedBoxWidth20,
            Text(
              logoItem.boldText,
              style: tsRegularText,
            ),
          ],
        ),
      ),
    );
  }
}
