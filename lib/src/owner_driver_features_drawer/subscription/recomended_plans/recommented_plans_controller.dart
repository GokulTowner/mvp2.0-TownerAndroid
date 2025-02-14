import '../../../../imports.dart';

class RecommentedPlansProvider extends ChangeNotifier {
  RecommentedPlansProvider() {
    callRcommentedPlans();
  }
  RecommentedService recommentedService = RecommentedService();
  List<RecommentedPlansModel> _recommentedPlans = [];
  List<RecommentedPlansModel> get recommentedPlans => _recommentedPlans;

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }

  Future<void> callRcommentedPlans() async {
    final result = await recommentedService.fetchRecommentPlans();

    if (result != null) {
      _recommentedPlans = result;
      notifyListeners();
    }
  }

  Future<void> addSubscription(
      String vehicleId, String planId, String planAmount) async {
    AddPlanModel data = AddPlanModel(
        vehicleId: vehicleId, planId: planId, planAmount: planAmount);
    final result = await recommentedService.addPlan(data);
    if (result != null) {
      flutterToastSuccessLong(result['message'], 14);
    }
  }
}
