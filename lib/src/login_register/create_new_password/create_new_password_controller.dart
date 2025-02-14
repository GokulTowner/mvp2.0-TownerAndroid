import 'dart:developer';
import 'package:townerapp/network/driver_repo.dart';

import '../../../imports.dart';

class CreateNewPasswordProvider extends ChangeNotifier {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  TextEditingController get password => _password;
  TextEditingController get passwordConfirm => _passwordConfirm;

  bool _showPass = false;
  bool get showPass => _showPass;

  void setShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  String? passwordValidation(String? value, BuildContext context) {
    // Validate if the value is empty
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterPassword;
    }

    return null;
  }

  String? connfirmPasswordValidation(String? value, BuildContext context) {
    // Validate if the value is empty
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterPassword;
    }

    return null;
  }

  bool checkPasswordMatch(BuildContext context) {
    log('message: _password $_password, Confirm Password $_passwordConfirm');
    if (_password.text == _passwordConfirm.text) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.passwordmissmatch);
      return false;
    }
  }

  Future<void> createNewPassword(BuildContext context, String mobileNo, String otp) async {



    final isPassMatch = checkPasswordMatch(context);
    if (isPassMatch == false) return;




    try {
      var map = {
        "email":mobileNo,
        "otp":otp,
        "newPwd":password.text,
        "conPwd":passwordConfirm.text
      };


      final result =  await DriverRepo.resetPassword(map);

      if (result != null && result['success']) {
        flutterToastSuccessLong('New password created successfully', 14);
        PopupMessagePasswordResetSuccess popupMessagePasswordResetSuccess =
        PopupMessagePasswordResetSuccess();
        popupMessagePasswordResetSuccess.showMessage(context);

      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      log("Error :- ${e.toString()}");
    }

  }
}
