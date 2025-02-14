import '../../../../../../imports.dart';

class ContactList extends StatelessWidget {
  final String leading;
  final String title;
  final String subtitle;

  const ContactList({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: leading == 'A'
            ? Colors.orange
            : leading == 'B'
                ? cBackgroundGreen
                : leading == 'C'
                    ? cBlueMain
                    : const Color(0xFF00FF51),
        child: Text(
          leading,
          style: TextStyle(
            fontSize: 17.0,
            color: leading == 'A' ? cDarkBlack : cWhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          color: cDarkBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13.0,
          color: cDarkBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
