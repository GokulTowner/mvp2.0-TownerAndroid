import '../../../imports.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            children: [
              const CustomHeader(title: 'Bank Account'),
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<BankAccountProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBoxHeight20,
                          CustomTextFormField(
                            textEditingController: provider.accountHolder,
                            isPass: false,
                            hint: 'Account Holder Name',
                          ),
                          sizedBoxHeight20,
                          CustomTextFormField(
                            textEditingController: provider.accountNumber,
                            isPass: false,
                            hint: 'Bank Account Number',
                          ),
                          sizedBoxHeight20,
                          CustomTextFormField(
                            textEditingController: provider.ifscCode,
                            isPass: false,
                            hint: 'IFSC Code',
                          ),
                          sizedBoxHeight20,
                          CustomTextFormField(
                            textEditingController: provider.branchName,
                            isPass: false,
                            hint: 'Branch Name',
                          ),
                          sizedBoxHeight20,
                          CustomTextButton(
                            text: 'Front Page of Passbook',
                            color: cLightGrey,
                            callBack: () {
                              Navigator.pushNamed(
                                  context, RouteClass.passbookandchequescreen);
                            },
                            textColor: cTextGrey,
                            border: 5,
                            fontSize: 16,
                            borderColor: cLightGrey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            elevation: 1,
                            child: ListTile(
                              leading: Image.asset('assets/images/upi.png'),
                              title: const Text(
                                'Add UPI ID',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              subtitle: const Text(
                                'Instant Payment using UPI App',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          sizedBoxHeight20,
                          CustomTextFormField(
                              textEditingController: provider.upiId,
                              isPass: false,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.setIsVerified();
                                  },
                                  icon: provider.isVerified == true
                                      ? const Icon(Icons.verified)
                                      : const Icon(Icons.lock)),
                              hint: 'Enter your UPI id'),
                          sizedBoxHeight30,
                          CustomButton(
                              onTap: () {
                                BankAccountCreateSuccessPopup
                                    ankAccountCreateSuccessPopup =
                                    BankAccountCreateSuccessPopup();
                                ankAccountCreateSuccessPopup
                                    .showMessage(context);
                              },
                              title: 'Verify & ADD'),
                          sizedBoxHeight30,
                          sizedBoxHeight20,
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
