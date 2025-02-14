import 'dart:developer';

import 'package:townerapp/imports.dart';

class RaiseNewTicketProvider extends ChangeNotifier {
  final List<String> _appIssueList = [
    'Mobile device Issue',
    'Wallet Issue',
    'Report Issue',
    'Incentive Issue',
    'Refferral Issue',
    'Trip Issue',
    'Customer Issue'
  ];

  List<String> get appIssueList => _appIssueList;

  String? _selectedDriver;
  String? get selectedDriver => _selectedDriver;

  String? _selectedVehicle;
  String? get selectedVehicle => _selectedVehicle;

  String? _appIssue;
  String? get appIssue => _appIssue;

  final TextEditingController _commentController = TextEditingController();
  TextEditingController get commentController => _commentController;

  Future<void> updateAppIssue(String? newIssue) async {
    if (newIssue == null) return;

    _appIssue = newIssue;
    // await settingsService?.updateLanguage(newCity);
    notifyListeners();
  }

  setSelectedDriver(String? selectedDriver) {
    if (selectedDriver == null) return;
    _selectedDriver = selectedDriver;
    log('vehicel :$selectedDriver');

    notifyListeners();
  }

  setSelectedVehicle(String? selectedVehicle) {
    if (selectedVehicle == null) return;
    _selectedVehicle = selectedVehicle;
    log('vehicel :$selectedVehicle');
    notifyListeners();
  }

  Future<void> submitTicket() async {
    // post data to back end

    _commentController.clear();
    _selectedDriver = null;
    _selectedVehicle = null;
    _appIssue = null;
  }
}
