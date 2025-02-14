import '../../../../../imports.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final addBusinessContactProviderWatch =
        context.watch<AddBusinessContactProvider>();

    return Scaffold(
      body: Container(
        margin: pPagePadding_16,
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.addContact),
                  sizedBoxHeight40,
                  CustomTextWidget(
                    text: AppLocalizations.of(context)!.fullNameCreateAccount,
                    size: 16.0,
                    color: cDarkBlack,
                    weight: FontWeight.w500,
                  ),
                  sizedBoxHeight10,
                  TextFormField(
                    controller: addBusinessContactProviderWatch.fullName,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egRaghuYadav,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!
                            .pleaseEnterFullName;
                      }
                      return null;
                    },
                  ),
                  sizedBoxHeight20,
                  CustomTextWidget(
                    text: AppLocalizations.of(context)!.mobileNumber,
                    size: 16.0,
                    color: cDarkBlack,
                    weight: FontWeight.w500,
                  ),
                  sizedBoxHeight10,
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: addBusinessContactProviderWatch.mobileNumber,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egmobileNumber,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterMobile;
                      } else if (value.length != 10) {
                        return AppLocalizations.of(context)!
                            .pleaseEnterTenDigitmobileNumber;
                      }
                      return null;
                    },
                  ),
                  // height05,
                  CustomTextWidget(
                    text: AppLocalizations.of(context)!.emailAddress,
                    size: 16.0,
                    color: cDarkBlack,
                    weight: FontWeight.w500,
                  ),
                  sizedBoxHeight10,
                  TextFormField(
                    controller: addBusinessContactProviderWatch.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egEmailAddress,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterEmailId;
                      }
                      return null;
                    },
                  ),

                  sizedBoxHeight70,
                  sizedBoxHeight70,
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        bool success = await addBusinessContactProviderWatch
                            .postAddContactData(context);
                        if (success) {
                          AddContactPopUpSuccessMessage
                              addContactPopUpSuccessMessage =
                              AddContactPopUpSuccessMessage();
                          addContactPopUpSuccessMessage.showMessage(context);
                        } else {
                          // Handle failure case here if needed
                          Fluttertoast.showToast(
                              msg: AppLocalizations.of(context)!
                                  .somethingWentWrong);
                        }
                      }
                    },
                    title: AppLocalizations.of(context)!.addContact,
                  ),

                  sizedBoxHeight45,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
