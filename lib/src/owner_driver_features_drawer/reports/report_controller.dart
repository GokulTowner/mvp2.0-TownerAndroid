import '../../../imports.dart';

class ReportProvider extends ChangeNotifier {
  ReportsService reportsService = ReportsService();
  Map<String, List<Report>> _dataMap = {};
  Map<String, List<Report>> get dataMap => _dataMap;

  String? _selectedReport;
  String? get selectedReport => _selectedReport;

  ReportProvider() {
    fetchReportData();
  }

  DateTime? startDate;
  DateTime? endDate;

  void setDateRange(DateTime? start, DateTime? end) {
    startDate = start;
    endDate = end;
    notifyListeners();
  }

  void clearDateRange() {
    startDate = null;
    endDate = null;
    notifyListeners();
  }

  void selectReport(String? report) {
    _selectedReport = report;
    notifyListeners();
  }

  Future<void> fetchReportData() async {
    final result = await reportsService.fetchReport();

    if (result != null) {
      _dataMap = result.reports;
      _selectedReport = _dataMap.keys.first;
      notifyListeners();
    }
  }
}
