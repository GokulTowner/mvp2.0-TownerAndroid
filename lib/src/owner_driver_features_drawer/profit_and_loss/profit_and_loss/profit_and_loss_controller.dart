import 'dart:developer';
import '../../../../imports.dart';

class ProfitAndLossProvider extends ChangeNotifier {
  ProfitAndLossProvider() {
    fetchProfitAndLoss();
  }
  ProfitAndLossService profitAndLossService = ProfitAndLossService();
  String netProfitOrLoss = '0';
  String overallPercentage = '0';
  String totalEarningsPercentage = '0';
  String totalExpenditurePercentage = '0';

  ProfitAndLossModel profitAndLossModel =
      ProfitAndLossModel(totalEarnings: '', totalExpenditure: '');

  percentageCalculator() {
    double percentageExp = (double.parse(profitAndLossModel.totalExpenditure) /
            double.parse(profitAndLossModel.totalEarnings)) *
        100;
    log('Percentage $percentageExp');
    double percentageEarn = 100 - percentageExp;
    log('Percentage ernings $percentageEarn');

    totalEarningsPercentage = percentageEarn.toString();
    totalExpenditurePercentage = percentageExp.toString();
    notifyListeners();
  }

  Future<void> fetchProfitAndLoss() async {
    final result = await profitAndLossService.fetchProfitAndLoss();
    if (result != null) {
      profitAndLossModel = result;
      netProfitOrLoss = profitAndLossModel.calculateNetProfitOrLoss();
      notifyListeners();
    }
    percentageCalculator();
  }
}
