import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../imports.dart';

class BusinessAnalyticsProvider extends ChangeNotifier {
  BusinessAnalyticsService businessAnalyticsService =
      BusinessAnalyticsService();

  BusinessAnalyticsProvider() {
    fetchBusinessAnalytics();
  }

  BusinessAnalyticsModel _businessAnalyticsModel =
      BusinessAnalyticsModel.defaultSettings();

  BusinessAnalyticsModel get businessAnalyticsModel => _businessAnalyticsModel;

  int flag = 0;
  String? _startDate;
  String? get startDate => _startDate;
  String? _endDate;
  String? get endDate => _endDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2023),
      firstDate: DateTime(2000),
      lastDate: DateTime(20505),
    );
    if (picked != null) {
      if (flag == 0) {
        String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
        _startDate = formattedDate;

        log("First Date: $_startDate");
        notifyListeners();
        flag = 1;

        showDialog(
          context: context,
          barrierDismissible: false, // prevent user from dismissing the dialog
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: cMainGreen,
                    backgroundColor: cDarkBlack,
                  ),
                  sizedBoxHeight10,
                  const Text(
                    'Select End Date',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        );
        await Future.delayed(const Duration(milliseconds: 500));

        Navigator.pop(context);

        selectDate(context);
      } else if (flag == 1) {
        String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
        _endDate = formattedDate;

        log('End Date : $_endDate');
        flag = 0;
        notifyListeners();
      }
    }
  }

  Future<void> fetchBusinessAnalytics() async {
    final result = await businessAnalyticsService.fetchBusinessAnalytic();
    if (result != null) {
      _businessAnalyticsModel = result;
      notifyListeners();
    }
  }
}
