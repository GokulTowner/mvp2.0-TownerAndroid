import '../../../../imports.dart';

class RecommentedPlans extends StatelessWidget {
  final String vehId;
  const RecommentedPlans({required this.vehId, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomHeader(title: AppLocalizations.of(context)!.recommendedPlans),
            Expanded(
              child: SubscriptionItemWidget(vehId: vehId),
            ),
          ],
        ),
      ),
    );
  }
}
