import 'dart:developer';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../imports.dart';

class OtpVarificationScreen extends StatelessWidget {
  final int flag;
  final String mobileNumber;
  final String finalOtp;
  final CreateAccountModel? createModal;


  final OtpVarificationProvider otpVarification = OtpVarificationProvider();

  OtpVarificationScreen({super.key, required this.flag, required this.mobileNumber, required this.finalOtp, required this.createModal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: pPadding_10, vertical: pPadding_10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<OtpVarificationProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.verificationCode),
                    sizedBoxHeight40,
                    Text(AppLocalizations.of(context)!.pleaseentertheOTP,
                        style: tsLargeText),
                    sizedBoxHeight40,
                    Image.asset(imgOtpLogo), // Replace with your image path
                    sizedBoxHeight40,
                    Text(
                      AppLocalizations.of(context)!.enter4digitcode,
                      style: tsMediumTextWithColorDarkGrey,
                    ),
                    sizedBoxHeight30,
                    PinFieldAutoFill(
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      currentCode: provider.otpValue,
                      codeLength: 4,
                      onCodeChanged: (code) {
                        provider.setOtpValue(code.toString());
                        log('onCodeChanged : $code');
                      },
                      onCodeSubmitted: (value) {
                        log('OnCodeSubmitted : $value');
                      },
                    ),
                    sizedBoxHeight40,
                    sizedBoxHeight40,
                    sizedBoxHeight40,
                    sizedBoxHeight40,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${provider.counter} sec',
                          style: tsLargeText,
                        ),
                        sizedBoxHeight20,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: CustomButton(
                                onTap: () {
                                  provider.verifyOtp(context, mobileNumber, flag, finalOtp, createModal);
                                  // provider.submitOtp('userId', context, flag);
                                },
                                title: AppLocalizations.of(context)!.submit),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.didntreceivedOTP,
                            style: tsMediumTextWithColorDarkGrey),
                        TextButton(
                          onPressed: () {
                            provider.listenOtp();
                            provider.reSentOtp('userId', context, mobileNumber);
                          },
                          child: Text(AppLocalizations.of(context)!.resentOtp),
                        ),
                      ],
                    ),
                    sizedBoxHeight20,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
