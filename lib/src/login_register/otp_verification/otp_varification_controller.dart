import 'dart:developer';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:townerapp/network/driver_repo.dart';
import '../../../imports.dart';

class OtpVarificationProvider extends ChangeNotifier {
  OtpVarificationProvider() {
    listenOtp();
    startTimer();
  }

  Timer? _timer;
  Timer? get timer => _timer;

  int _counter = 45;
  int get counter => _counter;

  String _otpValue = "";
  String? get otpValue => _otpValue;

  dynamic _appSignaturId;

  listenOtp() async {
    await SmsAutoFill().listenForCode();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        decrement();
      },
    );
  }

  setOtpValue(String otp) {
    _otpValue = otp;
    log('otp value : $_otpValue');
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void resetCounter() {
    _counter = 45;
    notifyListeners();
  }

  Future<void> autoCopyOtpsubmit() async {
    _appSignaturId = await SmsAutoFill().getAppSignature;
  }

  void verifyOtp(BuildContext context, String? mobileNo, int flag, String finalOtp, CreateAccountModel? createModal) async {
    if (_otpValue == finalOtp) {
      Fluttertoast.showToast(msg: 'Otp Verified Successfully');

      //if flag == 1 then the it will navigate to the create password screen which means owner or driver forgot the password.
      // else it will navigate to the success screen which means owner created a new account.
      if(flag == 1){
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  CreatePasswordScreen(
              flag: 1,
              mobileNo: mobileNo!,
              otp: finalOtp,
            ),
          ),
        );*/

        SmsAutoFill().unregisterListener();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNewPasswordScreen(
                  isOwner: context.read<LoginProvider>().isOwner,
                flag: 1,
                mobileN0: mobileNo!,
                otp: finalOtp,

              ),
            ),
                (route) => false);
      }else{
        await createAccount(context,createModal);
      }




    }else{
      Fluttertoast.showToast(msg: 'Invalid OTP');
    }
  }

  Future createAccount(BuildContext context,CreateAccountModel? createModal)async{


    if(createModal==null)return;

    var map = {

      "fname": createModal.firstName,
      "lname": createModal.lastName,
      "gender": "Male",
      "phone": createModal.ownerMobile,
      "email": createModal.emailAddress,
      "bname": createModal.businessName,
      "password": createModal.ownerPassword,
      "state": createModal.stateListModal?.createUserSuccessModalId??'',
      "statename": createModal.stateListModal?.name??'',
      "cnty": createModal.countryModal?.id??'',
      "city": createModal.cityListModal?.id??'',
      "cityname": createModal.cityListModal?.name??'',

    };

    final result =  await DriverRepo.signupDriver(map);

    if (result != null && result['success']) {
      // flutterToastSuccessLong('OTP verified Successfully', 14);

      SmsAutoFill().unregisterListener();
      PopupMessageAccountCreateSuccess popupMessageAccountCreateSuccess =
      PopupMessageAccountCreateSuccess();
      popupMessageAccountCreateSuccess.showMessage(context);

    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }


  Future<void> submitOtp(String userId, BuildContext context, int flag) async {
    OtpVarificationService otpVarificationService = OtpVarificationService();

    // posting the data to back end from controller
    final result = otpVarificationService.postOtp(userId, _otpValue);

    if (result != null) {
      flutterToastSuccessLong('OTP verified Successfully', 14);

      //if flag == 1 then the it will navigate to the create password screen which means owner or driver forgot the password.
      // else it will navigate to the success screen which means owner created a new account.
      if (flag == 1) {
       /* SmsAutoFill().unregisterListener();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNewPasswordScreen(
                  isOwner: context.read<LoginProvider>().isOwner),
            ),
            (route) => false);*/
      } else if (flag == 2) {
        SmsAutoFill().unregisterListener();
        PopupMessageAccountCreateSuccess popupMessageAccountCreateSuccess =
            PopupMessageAccountCreateSuccess();
        popupMessageAccountCreateSuccess.showMessage(context);
      }
    }
  }

  Future<void> reSentOtp(
      String userId, BuildContext context, String mobileNumber) async {
    OtpVarificationService otpVarificationService = OtpVarificationService();

    // posting the data to back end from controller
    final result =
        otpVarificationService.resentOtp(userId, mobileNumber, _appSignaturId);

    if (result != null) {
      log('Resent otp called');
      resetCounter();
      flutterToastSuccessLong('OTP Resent Successfully', 14);
    }
  }
}
