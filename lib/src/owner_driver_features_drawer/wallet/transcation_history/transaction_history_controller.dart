import '../../../../imports.dart';

class TransactionHistoryProvider extends ChangeNotifier {
  TransactionHistoryProvider() {
    fetchTransactionHistory();
  }
  TransactionService transactionService = TransactionService();
  final TextEditingController _selectedDate = TextEditingController();
  TextEditingController get selectedDate => _selectedDate;

  TransactionHistoryModel transactionHistory =
      TransactionHistoryModel(transactions: []);

  Future<void> fetchTransactionHistory() async {
    final result = await transactionService.fetchTransactionHistory();
    if (result != null) {
      transactionHistory = result;
      notifyListeners();
    }
  }
}
