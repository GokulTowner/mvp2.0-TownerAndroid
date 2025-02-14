import '../../../imports.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final int flag;
  final String mobileN0;
  final String otp;
  final bool? isOwner;
  final _formKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({super.key, required this.flag, required this.mobileN0, required this.otp, this.isOwner});

  @override
  Widget build(BuildContext context) {
    final createNewPasswordProvider =
        Provider.of<CreateNewPasswordProvider>(context, listen: false);
    final createNewPasswordProviderWatch =
        context.watch<CreateNewPasswordProvider>();
    return Scaffold(
      body: Padding(
        padding: pPagePadding_24,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeader(title: ''),
                  sizedBoxHeight30,
                  Text(AppLocalizations.of(context)!.createPassword,
                      style: tsExLargeTextBold),
                  sizedBoxHeight20,
                  Text(AppLocalizations.of(context)!.createPasswordDiscription,
                      style: tsMediumTextWithColorDarkGrey),
                  sizedBoxHeight40,
                  Text(AppLocalizations.of(context)!.pin, style: tsRegularText),
                  sizedBoxHeight10,
                  CustomTextFormField(
                    textInputType: isOwner != true
                        ? TextInputType.visiblePassword
                        : TextInputType.text,
                    suffixIcon: IconButton(
                      onPressed: () {
                        createNewPasswordProvider.setShowPass();
                      },
                      icon: Icon(
                        createNewPasswordProviderWatch.showPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: cIconColorTxtFrmFld,
                      ),
                    ),
                    maxLength: isOwner != true ? 10 : 10,
                    validator: (value) {
                      return createNewPasswordProvider.passwordValidation(
                          value, context);
                    },
                    textEditingController: createNewPasswordProvider.password,
                    isPass: createNewPasswordProvider.showPass,
                    hint: AppLocalizations.of(context)!.passwordHint,
                  ),
                  sizedBoxHeight20,
                  Text(AppLocalizations.of(context)!.confirmPIN,
                      style: tsRegularText),
                  sizedBoxHeight10,
                  CustomTextFormField(
                      textInputType: isOwner != true
                          ? TextInputType.visiblePassword
                          : TextInputType.text,
                      maxLength: isOwner != true ? 10 : 10,
                      validator: (value) {
                        return createNewPasswordProvider.passwordValidation(
                            value, context);
                      },
                      textEditingController:
                          createNewPasswordProvider.passwordConfirm,
                      isPass: true,
                      hint: AppLocalizations.of(context)!.passwordHint),
                  sizedBoxHeight10,
                  sizedBoxHeight40,
                  CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          createNewPasswordProvider.createNewPassword(
                              context, mobileN0,otp);
                          // Form is valid, perform the desired action
                          // e.g., submit data, navigate to the next screen
                        }
                      },
                      title: AppLocalizations.of(context)!.submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
