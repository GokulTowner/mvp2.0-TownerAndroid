import '../../../../imports.dart';

class CustomFAQHeader extends StatelessWidget {
  final String title;
  const CustomFAQHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: pPagePadding_10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cWhiteColor,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: cBackgroundBlack,
            ),
          ),
        ),
        Text(
          title,
          style: tsRegularTextBold,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewFAQ(),
              ),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.addNew,
            style: tsRegularTextUnderline,
          ),
        ),
      ],
    );
  }
}
