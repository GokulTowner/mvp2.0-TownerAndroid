import '../../../imports.dart';

class ForgorPasswordScreen extends StatelessWidget {
  ForgorPasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: pPadding_20,
          right: pPadding_20,
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: ''),
                sizedBoxHeight30,
                Text(AppLocalizations.of(context)!.forgotPassword,
                    style: tsExLargeText),
                sizedBoxHeight20,
                Text(
                  AppLocalizations.of(context)!.forgotPasswordScreenIntro,
                  style: tsMediumTextWithColorDarkGrey,
                ),
                sizedBoxHeight30,
                CustomTextFormField(
                  maxLength: 10,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    return forgotPasswordProvider.mobileNumberValidation(
                        value, context);
                  },
                  textEditingController: forgotPasswordProvider.mobileNumber,
                  isPass: false,
                  hint: AppLocalizations.of(context)!.enterYourMobileNumber,
                  prefixIcon: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        sizedBoxHeight10,
                        const Text(
                          '+91',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                        sizedBoxHeight5,
                        Container(
                          color: cWhiteColor,
                          height: 30,
                          width: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      forgotPasswordProvider.forgotPassword(context);
                    }
                  },
                  title: AppLocalizations.of(context)!.submit,
                ),
                sizedBoxHeight20
              ],
            ),
          ),
        ),
      ),
    );
  }
}
