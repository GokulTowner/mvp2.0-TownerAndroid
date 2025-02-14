import '../../../../imports.dart';

class YesNoButton extends StatefulWidget {
  final String text;
  const YesNoButton({super.key, required this.text});

  @override
  State<YesNoButton> createState() => _YesNoButtonState();
}

class _YesNoButtonState extends State<YesNoButton> {
  String groupValue = "Yes";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            color: cDarkBlack,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
                value: "Yes",
                activeColor: cDarkBlack,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            const Text(
              "Yes",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFa8a8a8),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Radio(
                value: "No",
                activeColor: cDarkBlack,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            const Text(
              "No",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFa8a8a8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
