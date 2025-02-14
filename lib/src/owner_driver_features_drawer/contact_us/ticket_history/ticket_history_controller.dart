import 'package:townerapp/imports.dart';

class TicketHistoryOwnerProvider extends ChangeNotifier {
  String _selectedFilterValue = 'all';

  String get selctedFilterValue => _selectedFilterValue;

  setFilterValue(String? newFilterValue) {
    if (newFilterValue == null) return;
    _selectedFilterValue = newFilterValue;
    notifyListeners();
  }
}
