import 'dart:developer';
import '../../../../imports.dart';

class TotalEarningsProvider extends ChangeNotifier {
  TotalEarningsProvider() {
    fetchTotalEarnings();
  }
  TotalEarningsService totalEarningsService = TotalEarningsService();

  String cashEarningsPercent = '0';
  String walletEarningsPercent = '0';

  TotalEarningsModel totalEarningsModel = TotalEarningsModel.defaultSettings();

  percentageCalculator() {
    double percentageExp = (totalEarningsModel.cashEarnings) /
        (totalEarningsModel.walletEarnings + totalEarningsModel.cashEarnings) *
        100;
    log('Percentage $percentageExp');
    double percentageEarn = 100 - percentageExp;
    log('Percentage ernings $percentageEarn');

    cashEarningsPercent = percentageEarn.toStringAsFixed(1);
    walletEarningsPercent = percentageExp.toStringAsFixed(1);
    notifyListeners();
  }

  Future<void> fetchTotalEarnings() async {
    final result = await totalEarningsService.fetchProfitAndLoss();
    if (result != null) {
      totalEarningsModel = result;
      log("totalEarnings ${totalEarningsModel.cashEarnings}");
      notifyListeners();
    }
    percentageCalculator();
  }
}
