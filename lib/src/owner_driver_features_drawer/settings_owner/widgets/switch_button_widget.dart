import '../../../../imports.dart';

class SwitchButtonWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool switchValue;
  final Function(bool)? function;
  const SwitchButtonWidget(
      {this.subTitle,
      this.title,
      this.function,
      required this.switchValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pPaddingHorizontal_10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            subTitle ?? "",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: cTextDarkGrey),
          ),
          Switch(value: switchValue, onChanged: function),
        ],
      ),
    );
  }
}
