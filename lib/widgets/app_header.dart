import '../imports.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final bool? isOption;
  final Widget? widgets;

  const CustomHeader(
      {super.key, this.isOption, this.widgets, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: pPagePadding_4,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF1F2F6),
          ),
          child: IconButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await Future.delayed(const Duration(milliseconds: 100));
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF707070),
            ),
          ),
        ),
        Text(
          title,
          style: tsMediumTextBold,
        ),
        isOption == true
            ? Container(
                margin: pPagePadding_4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: widgets)
            : const SizedBox(),
      ],
    );
  }
}
