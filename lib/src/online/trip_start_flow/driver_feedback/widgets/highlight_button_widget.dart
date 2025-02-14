// ignore_for_file: must_be_immutable

import '../../../../../imports.dart';

class HighlightButton extends StatefulWidget {
  final String text;
  late bool state;
  final VoidCallback? onTap;

  HighlightButton({
    super.key,
    required this.text,
    required this.state, this.onTap,
  });

  @override
  State<HighlightButton> createState() => _HighlightButtonState();
}

class _HighlightButtonState extends State<HighlightButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap??()=> setState(() {
          widget.state = !widget.state;
        }),
      child: Container(
        decoration: BoxDecoration(
          color: widget.state ? cDarkBlack : cWhiteColor,
          border: widget.state
              ? null
              : Border.all(
                  width: 1,
                  color: const Color(0xFF707070),
                ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: pPagePadding_10,
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.state ? cWhiteColor : cDarkBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
