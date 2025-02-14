import 'package:sms_autofill/sms_autofill.dart';
import 'package:townerapp/network/driver_repo.dart';
import '../../../imports.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  ForgotPasswordService forgotPasswordService = ForgotPasswordService();

  final TextEditingController _mobileNumber = TextEditingController();
  dynamic _appSignatureId;

  TextEditingController get mobileNumber => _mobileNumber;

  String? mobileNumberValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.enterYourRegisteredMobileNumber;
    } else if (value.length != 10) {
      return AppLocalizations.of(context)!.enterValidMobileNumber;
    }
    return null;
  }

// It is using for getting the app signature
  Future<void> autoCopyOtpsubmit() async {
    if (_mobileNumber.text == "") return;
    _appSignatureId = await SmsAutoFill().getAppSignature;
  }

// as per the instruction by ceo forgot password otp should go to
// the owner mobile number only, that logic have to do when connecting to api......

// posting mobile number to back end and then if it success, will get the otp
  Future<void> forgotPassword(BuildContext context) async {
    bool isOwner = context.read<LoginProvider>().isOwner;
    await autoCopyOtpsubmit();




    final mobileNumber = _mobileNumber.text;

    if (mobileNumber.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!
              .pleaseEnterMobileNumber);
      return;
    }

    var map = {
      "email":  mobileNumber
    };


    final result =  await DriverRepo.forgotPassword(map);

    if (result != null && result['success'] == true) {
      Provider.of<OtpVarificationProvider>(context, listen: false)
          .resetCounter();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVarificationScreen(
            flag: 1,
            mobileNumber: mobileNumber,
            createModal: null,
            finalOtp: result["OTP"],
          ),
        ),
      );

      Fluttertoast.showToast(msg: '${result['message']}');
    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }
}
