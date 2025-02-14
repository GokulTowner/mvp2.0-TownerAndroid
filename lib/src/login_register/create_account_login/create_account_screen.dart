import 'package:townerapp/src/intro_slide/language_select/widgets/custom_dropdown_button_select_country.dart';

import '../../../imports.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createAccountLoginProvider =
    Provider.of<CreateAccountProvider>(context, listen: false);
    final createAccountLoginProviderWatch =
    context.watch<CreateAccountProvider>();
    return Scaffold(
      body: Padding(
        padding: pPagePadding_16,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomHeader(
                      title: AppLocalizations.of(context)!.createaaccount),
                  sizedBoxHeight20,
                  CustomTextFormField(
                    validator: (value) => createAccountLoginProvider
                        .businessNameValidation(value, context),
                    textEditingController: createAccountLoginProvider.firstname,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.firstname,
                  ),
                  sizedBoxHeight20,
                  CustomTextFormField(
                    textEditingController: createAccountLoginProvider.lastname,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.lastname,
                  ),
                  sizedBoxHeight20,
                  CustomTextFormField(
                    validator: (value) => createAccountLoginProvider
                        .ownerMobileValidation(value, context),
                    maxLength: 10,
                    textInputType: TextInputType.number,
                    textEditingController:
                    createAccountLoginProvider.ownerMobile,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.ownermobileNumber,
                  ),
                  CustomTextFormField(
                    validator: (value) => createAccountLoginProvider
                        .ownerPasswordValidation(value, context),
                    textEditingController:
                    createAccountLoginProvider.ownerPassword,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.ownerpassword,
                  ),
                  sizedBoxHeight20,
                  CustomTextFormField(
                    validator: (value) => createAccountLoginProvider
                        .ownerConfirmPasswordValidation(value, context),
                    textEditingController:
                    createAccountLoginProvider.ownerConfirmPassword,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.ownerConfirmPassword,
                  ),
                  sizedBoxHeight20,
                  CustomTextFormField(
                    validator: (value) => createAccountLoginProvider
                        .vehicleValidation(value, context),
                    textInputType: TextInputType.emailAddress,
                    textEditingController:
                    createAccountLoginProvider.emailAddress,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.emailAddress,
                  ),
                  sizedBoxHeight10,
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: createAccountLoginProvider.isOwnerComeDriver,
                  //       checkColor: cDarkBlack,
                  //       activeColor: cMainGreen,
                  //       onChanged: (value) {
                  //         createAccountLoginProvider.setIsOwnerComeDriver();
                  //       },
                  //     ),
                  //     Text(
                  //       AppLocalizations.of(context)!.selectifownercumdriver,
                  //       style: tsRegularTextBold,
                  //     ),
                  //   ],
                  // ),

                  // Column(
                  //   children: [
                  //     sizedBoxHeight10,
                  //     CustomTextFormField(
                  //       validator: (value) => createAccountLoginProvider
                  //           .driverMobileValidation(value, context),
                  //       maxLength: 10,
                  //       textInputType: TextInputType.number,
                  //       textEditingController:
                  //           createAccountLoginProviderWatch.isOwnerComeDriver
                  //               ? createAccountLoginProvider.ownerMobile
                  //               : createAccountLoginProvider.driverMobile,
                  //       isPass: false,
                  //       hint: AppLocalizations.of(context)!.drivermobileNumber,
                  //     ),
                  //   ],
                  // ),

                  // createAccountLoginProviderWatch.isOwnerComeDriver == false
                  //     ? Column(
                  //         children: [
                  //           CustomTextFormField(
                  //             validator: (value) => createAccountLoginProvider
                  //                 .ownerNameValidation(value, context),
                  //             textEditingController:
                  //                 createAccountLoginProvider.driverName,
                  //             isPass: false,
                  //             hint: AppLocalizations.of(context)!.drivername,
                  //           ),
                  //           sizedBoxHeight20,
                  //           CustomTextFormField(
                  //             validator: (value) => createAccountLoginProvider
                  //                 .createPasswordValidation(value, context),
                  //             textEditingController:
                  //                 createAccountLoginProvider.createPassword,
                  //             isPass: createAccountLoginProvider.showPass,
                  //             hint: AppLocalizations.of(context)!
                  //                 .createdriverpassword,
                  //             suffixIcon: IconButton(
                  //               onPressed: () {
                  //                 createAccountLoginProvider.setShowPass();
                  //               },
                  //               icon: Icon(
                  //                 createAccountLoginProviderWatch.showPass
                  //                     ? Icons.visibility_off
                  //                     : Icons.visibility,
                  //                 color: const Color(0xFFA8A8A8),
                  //               ),
                  //             ),
                  //           ),
                  //           sizedBoxHeight20,
                  //           CustomTextFormField(
                  //             validator: (value) {
                  //               createAccountLoginProvider
                  //                   .confirmPasswordValidation(value, context);
                  //               createAccountLoginProvider
                  //                   .createAndConfirmPasswordCheck(context);
                  //               return null;
                  //             },
                  //             textEditingController:
                  //                 createAccountLoginProvider.confirmPassword,
                  //             isPass: true,
                  //             hint: AppLocalizations.of(context)!
                  //                 .coinfirmdriverpassword,
                  //           ),
                  //         ],
                  //       )
                  //     : sizedBoxHeight10,
                  sizedBoxHeight10,
                  // const Divider(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Checkbox(
                  //         value: createAccountLoginProvider.isRefferralCode,
                  //         checkColor: cDarkBlack,
                  //         activeColor: cMainGreen,
                  //         onChanged: (value) {
                  //           createAccountLoginProvider.setIsRefferralCode();
                  //         }),
                  //     Text(
                  //       AppLocalizations.of(context)!
                  //           .selectifyouhaveareferralcode,
                  //       style: tsRegularTextBold,
                  //     ),
                  //   ],
                  // ),
                  // createAccountLoginProviderWatch.isRefferralCode
                  // ?
                  Column(
                    children: [
                      sizedBoxHeight10,
                      CustomTextFormField(
                        textEditingController:
                        createAccountLoginProvider.referralCode,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.enterreferralcode,
                      ),
                      sizedBoxHeight20,
                      // CustomTextFormField(
                      //   textEditingController:
                      //       createAccountLoginProvider.distributorCode,
                      //   isPass: false,
                      //   hint: AppLocalizations.of(context)!.distributorCode,
                      // ),

                      const SizedBox(  // for country
                          height: 48,
                          child: CustomDropdownButtonContry()),
                      sizedBoxHeight20,

                      const SizedBox( // for the state
                          height: 48,
                          child: CustomDropdownButtonState()),
                      sizedBoxHeight20,

                      const SizedBox(   //for the city
                          height: 48,
                          child: CustomDropdownButtonCity()),
                      sizedBoxHeight20,


                    ],
                  ),
                  // :
                  sizedBoxHeight20,
                  CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          createAccountLoginProvider.autoCopyOtpsubmit();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: cDarkBlack,
                                  color: cMainGreen,
                                  strokeWidth: 7,
                                ),
                              );
                            },
                          );
                          createAccountLoginProvider.createAccount(context);
                        }
                      },
                      title: AppLocalizations.of(context)!.register),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.alreadyhaveanaccount,
                          style: tsRegularTextWithColorGrey),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.signIn,
                            style: tsRegularTextUnderline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
