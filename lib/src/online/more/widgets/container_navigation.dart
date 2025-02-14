import '../../../../imports.dart';

class ContainerNavigation extends StatelessWidget {
  final String title;
  final bool? isOption;
  final VoidCallback? onTap;

  const ContainerNavigation(
      {super.key, this.isOption, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 40,
            height: 40,
            margin: pPagePadding_4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF1F2F6),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF707070),
            ),
          ),
        ],
      ),
    );
  }
}
