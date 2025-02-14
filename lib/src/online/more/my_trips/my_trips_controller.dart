import '../../../../imports.dart';

class MyRidesProvider extends ChangeNotifier {
  DateTime? startDate;
  DateTime? endDate;
  String selectedOption = 'Past';

  void setDateRange(DateTime? start, DateTime? end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  void setSelectedOption(String option) {
    selectedOption = option;
    notifyListeners();
  }

  void clearDateRange() {
    startDate = null;
    endDate = null;
    notifyListeners();
  }
}
