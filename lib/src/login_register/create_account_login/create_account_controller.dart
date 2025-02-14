import 'dart:developer';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:townerapp/network/driver_repo.dart';
import '../../../imports.dart';

class CreateAccountProvider extends ChangeNotifier {
  CreateAccountService createAccountService = CreateAccountService();

  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _ownerName = TextEditingController();
  final TextEditingController _ownerMobile = TextEditingController();
  final TextEditingController _ownerPassword = TextEditingController();
  final TextEditingController _ownerConfirmPassword = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _driverMobile = TextEditingController();
  final TextEditingController _driverName = TextEditingController();
  final TextEditingController _createPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _referralCode = TextEditingController();
  final TextEditingController _distributorCode = TextEditingController();
  bool _isOwnerComeDriver = false;
  bool get isOwnerComeDriver => _isOwnerComeDriver;

  bool _isRefferralCode = false;
  bool get isRefferralCode => _isRefferralCode;

  bool _showPass = true;
  bool get showPass => _showPass;

  dynamic _appSignaturId;

  TextEditingController get firstname => _businessName;
  TextEditingController get lastname => _ownerName;
  TextEditingController get ownerMobile => _ownerMobile;
  // TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get emailAddress => _emailAddress;
  TextEditingController get ownerPassword => _ownerPassword;
  TextEditingController get ownerConfirmPassword => _ownerConfirmPassword;
  TextEditingController get driverMobile => _driverMobile;
  TextEditingController get driverName => _driverName;
  TextEditingController get createPassword => _createPassword;
  TextEditingController get confirmPassword => _confirmPassword;
  TextEditingController get referralCode => _referralCode;
  TextEditingController get distributorCode => _distributorCode;

  setShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  setIsOwnerComeDriver() {
    _isOwnerComeDriver = !_isOwnerComeDriver;
    notifyListeners();
  }

  setIsRefferralCode() {
    _isRefferralCode = !_isRefferralCode;
    notifyListeners();
  }

  Future<void> autoCopyOtpsubmit() async {
    if (_ownerMobile.text == "") return;
    _appSignaturId = await SmsAutoFill().getAppSignature;

    Map<String, dynamic> sendOtpData = {
      "mobileNumber": _ownerMobile.text,
      "appSignatureId": _appSignaturId
    };

    log(sendOtpData.toString());
  }

  String? businessNameValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterbusinessname;
    }
    return null;
  }

  String? ownerNameValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterownername;
    }
    return null;
  }

  String? ownerMobileValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterownermobileNumber;
    } else if (value.length < 10) {
      return AppLocalizations.of(context)!.entervalidownermobileNumber;
    }
    return null;
  }

  String? ownerPasswordValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterthepassword;
    }
    return null;
  }

  String? ownerConfirmPasswordValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterthepasswordagain;
    }
    return null;
  }

  String? vehicleValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseentervehiclenumber;
    }
    return null;
  }

  String? driverMobileValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterMobileNumber;
    } else if (value.length < 10) {
      return AppLocalizations.of(context)!.enterValidMobileNumber;
    }
    return null;
  }

  String? createPasswordValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterthepassword;
    }
    return null;
  }

  String? confirmPasswordValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterthepasswordagain;
    }
    return null;
  }

  String? createAndConfirmPasswordCheck(
      BuildContext context,
      ) {
    if (_createPassword.text != _confirmPassword.text) {
      return AppLocalizations.of(context)!
          .passwordmissmatchpleasecheckonceagain;
    }
    return null;
  }

  Future<bool> createAccount(BuildContext context) async {
    await autoCopyOtpsubmit();
    var country = context.read<LanguageSelectProvider>().selectedUserCountry;
    var states = context.read<LanguageSelectProvider>().selectedUserState;
    var city = context.read<LanguageSelectProvider>().selectedUserCity;

    CreateAccountModel data = CreateAccountModel(
        businessName: _businessName.text,
        ownerName: _ownerName.text,
        ownerMobile: _ownerMobile.text,
        // vehicleNumber: _vehicleNumber.text,
        emailAddress: _emailAddress.text,
        ownerPassword: _ownerPassword.text,
        driverMobile: _driverMobile.text,
        createPassword: _createPassword.text,
        confirmPassword: _confirmPassword.text,
        mobileNumber: _ownerMobile.text,
        countryModal: country,
        stateListModal: states,
        cityListModal: city,
        firstName: firstname.text,
        lastName: lastname.text,
        appSignature: _appSignaturId);

    var map = {
      "phone" : _ownerMobile.text.trim(),
      "phcode": "+91",
      "email": "",
      "otp": ""
    };
    final result =  await DriverRepo.verifyOtp(map);

    if (result != null && result['success'] == true) {


      Navigator.pop(context);
      Provider.of<OtpVarificationProvider>(context, listen: false)
          .resetCounter();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OtpVarificationScreen(flag: 2, mobileNumber: _ownerMobile.text,
                createModal: data,
                finalOtp: result['code'],

              ),
        ),
      );
      flutterToastSuccessLong('${result['message']}', 14);

      return true;

      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  OtpVarificationScreen(
            flag: 2,
            createModal: data,
            finalOtp: result['code'],
          ),
        ),
      );*/

      Fluttertoast.showToast(msg: '${result['message']}');
    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
      return false;
    }
  }
}
