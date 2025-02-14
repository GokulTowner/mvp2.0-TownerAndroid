import 'dart:developer';
import '../../../../imports.dart';

class AddNewExpenditureProvider extends ChangeNotifier {
  AddNewExpenditureProvider() {
    getExpenditureList();
  }
  AddNewExpenditureService addNewExpenditureService =
      AddNewExpenditureService();

  List<String> _expenditureList = [];
  List<String> get expenditureList => _expenditureList;

  final TextEditingController _gstAmount = TextEditingController();
  TextEditingController get gstAmount => _gstAmount;

  final TextEditingController _gstNumber = TextEditingController();
  TextEditingController get gstNumber => _gstNumber;

  final TextEditingController _gstExpenseAmount = TextEditingController();
  TextEditingController get gstExpenseAmount => _gstExpenseAmount;

  String? _selectedExpenditure;
  String? get selectedExpenditure => _selectedExpenditure;

  File? _expenditureImage;
  File? _expenditurePdf;
  String? selectedPdfLastPath;
  File? get expenditureImage => _expenditureImage;
  File? get expenditurePdf => _expenditurePdf;

  bool _isGst = false;
  bool get isGst => _isGst;

  setIsGst() {
    _isGst = !_isGst;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_expenditurePdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  Future<void> getExpenditureList() async {
    final result = await addNewExpenditureService.fetchGetExpenditureOptions();
    if (result != null) {
      _expenditureList = result;
      notifyListeners();
    }
  }
}
