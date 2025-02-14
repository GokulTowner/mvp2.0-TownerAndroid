import '../../../../imports.dart';

class TotalExpenseProvider extends ChangeNotifier {
  TotalExpenseProvider() {
    fetchTotalExpenditures();
  }

  bool _withGst = false;
  bool get withGst => _withGst;

  final TotalExpendituresService _totalExpendituresService =
      TotalExpendituresService();

  TotalExpendituresModel _totalExpendituresModel =
      TotalExpendituresModel(totalExpenditures: 0, transactions: []);
  TotalExpendituresModel get totalExpendituresModel => _totalExpendituresModel;

  List<TransactionExpense> get filteredTransactions {
    if (_withGst) {
      return _totalExpendituresModel.transactions
          .where((transaction) => transaction.withGstBill == _withGst)
          .toList();
    } else {
      return totalExpendituresModel.transactions;
    }
  }

  setIsGst() {
    _withGst = !_withGst;
    notifyListeners();
  }

  Future<void> fetchTotalExpenditures() async {
    final result = await _totalExpendituresService.fetchTotalExpenditure();
    if (result != null) {
      _totalExpendituresModel = result;
      notifyListeners();
    }
  }
}
