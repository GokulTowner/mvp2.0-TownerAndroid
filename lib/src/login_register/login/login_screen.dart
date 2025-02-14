import '../../../imports.dart';

class LoginScreen extends StatelessWidget {
  final bool? isOwner;

  LoginScreen({this.isOwner, super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final loginProviderWatch = context.watch<LoginProvider>();
    if (loginProvider.isOwner == true) {
      loginProvider.setIsOwnerTrue();
    } else {
      loginProvider.setIsOwnerFalse();
    }

    return Scaffold(
      body: Padding(
        padding: pPagePadding_16,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight30,
                Text(AppLocalizations.of(context)!.helloPartner,
                    style: tsExLargeText),
                sizedBoxHeight20,
                Center(
                  child: Image.asset(
                    imgLogo2,
                  ),
                ),
                sizedBoxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.welcomeBackToTowner,
                        style: tsLargeTextBold),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (loginProvider.isOwner == true)
                          ? 'T-${AppLocalizations.of(context)!.ownerLogin}'
                          : AppLocalizations.of(context)!.driverLogin,
                      style: tsLargeText,
                    ),
                  ],
                ),
                sizedBoxHeight40,
                CustomTextFormField(
                  textInputType: TextInputType.number,
                  textEditingController: loginProvider.mobile,
                  maxLength: 10,
                  isPass: false,
                  hint: AppLocalizations.of(context)!.enterYourMobileNumber,
                  validator: (value) {
                    return loginProvider.mobileValidation(value,
                        context: context);
                  },
                  prefixIcon: Padding(
                    padding: pPagePadding_8,
                    child: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          sizedBoxHeight10,
                          const Text('+91', style: tsRegularTextWithHintColor),
                          sizedBoxHeight5,
                          Container(
                            color: cBackgroundWhite,
                            height: 30,
                            width: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  suffixIcon: null,
                ),
                sizedBoxHeight30,
                CustomTextFormField(
                  textEditingController: loginProvider.password,
                  isPass: loginProvider.showPass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.pleaseenterPassword;
                    }
                    return null;
                  },
                  hint: AppLocalizations.of(context)!.enterPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginProvider.setShowPass();
                    },
                    icon: Icon(
                      loginProviderWatch.showPass
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xFFA8A8A8),
                    ),
                  ),
                ),
                sizedBoxHeight10,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.forgotPasswordScreen);
                    },
                    child: Text(AppLocalizations.of(context)!.forgotPassword,
                        style: tsRegularTextUnderline),
                  ),
                ),
                sizedBoxHeight40,
                sizedBoxHeight10,
                CustomButton(
                    onTap: () async {
                      // Validate the form
                      if (_formKey.currentState!.validate()) {
                        await loginProvider.loginRequest(context);
                      }
                    },
                    title: AppLocalizations.of(context)!.signIn),
                sizedBoxHeight10,
                loginProvider.isOwner == false //make false
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(                             //commited line
                            //   AppLocalizations.of(context)!
                            //       .dontHaveAnAccountSwipeRightTo,
                            //   style: tsRegularTextWithColorGrey,
                            // ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    RouteClass.createAccountLoginScreen);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.createNewAccount,
                                style: tsRegularTextBold,
                              ),
                            )
                          ],
                        ),
                      )
                    : sizedBoxHeight20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
