import '../../../../imports.dart';

class DrawerWidgetTile extends StatelessWidget {
  final IconData? icon;
  final Widget? subtitle;
  final Function onPressed;
  final Widget? trailing;
  final String text;
  const DrawerWidgetTile(
      {super.key,
      this.icon,
      required this.text,
      this.trailing,
      this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: cDarkBlack,
      ),
      onTap: () {
        onPressed();
      },
      title: Text(
        text,
        style: tsSmallText,
      ),
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
