import '../../../../imports.dart';

class ExpandableContainer extends StatelessWidget {
  final String heading;
  const ExpandableContainer({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        color: const Color(0xFFF9FAFB),
        width: double.infinity,
        padding: pPagePadding_16,
        child: Consumer<FAQProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        heading,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: provider.expanded
                          ? const Icon(
                              Icons.keyboard_arrow_up,
                              size: 30,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                            ),
                      onPressed: () {
                        provider.setExpanded();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: provider.expanded ? null : 50.0,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque tortor vitae efficitur tincidunt. Maecenas pulvinar justo in arcu vulputate, sit amet mattis velit aliquam. Curabitur luctus ante in felis finibus, ut facilisis magna sollicitudin. Sed tincidunt pulvinar facilisis. Vivamus venenatis massa sed elit bibendum, a aliquet nibh ullamcorper. Sed eget nisl at metus luctus efficitur. Donec varius bibendum elit, ut volutpat orci posuere vitae.',
                          style: const TextStyle(
                              color: Color(0xFF676767), fontSize: 16),
                          maxLines: provider.expanded ? null : 2,
                          overflow:
                              provider.expanded ? null : TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    if (!provider.expanded)
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () {
                          // Handle share icon tapped
                        },
                      ),
                  ],
                ),
                if (provider.expanded) sizedBoxHeight20,
                if (provider.expanded)
                  Text(
                    AppLocalizations.of(context)!.stillHaveIssues,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (provider.expanded) sizedBoxHeight20,
                if (provider.expanded)
                  Row(children: [
                    Image.asset('assets/images/chat_us.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.chatWithUs,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                if (provider.expanded)
                  const SizedBox(
                    height: 15,
                  ),
                if (provider.expanded)
                  Row(children: [
                    Image.asset('assets/images/call_us.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      AppLocalizations.of(context)!.callUs,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
