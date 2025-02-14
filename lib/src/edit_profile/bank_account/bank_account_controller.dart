import '../../../imports.dart';

class BankAccountProvider extends ChangeNotifier {
  final TextEditingController _accountHolder = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  final TextEditingController _branchName = TextEditingController();
  final TextEditingController _upiId = TextEditingController();

  TextEditingController get accountHolder => _accountHolder;
  TextEditingController get accountNumber => _accountNumber;
  TextEditingController get ifscCode => _ifscCode;
  TextEditingController get branchName => _branchName;
  TextEditingController get upiId => _upiId;

  bool _isVerified = true;
  bool get isVerified => _isVerified;

  setIsVerified() {
    _isVerified = !_isVerified;
    notifyListeners();
  }
}
