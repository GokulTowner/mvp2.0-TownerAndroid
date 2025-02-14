import '../../../imports.dart';

class BankAccountDriverScreen extends StatelessWidget {
  // final TextEditingController _cancelledCheque = TextEditingController();
  final TextEditingController _accountHolder = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  final TextEditingController _branchName = TextEditingController();
  // final TextEditingController _frontPage = TextEditingController();

  BankAccountDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: 'Owner Bank Account Details'),
                sizedBoxHeight20,
                sizedBoxHeight20,
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFormField(
                    textEditingController: _accountHolder,
                    isPass: false,
                    hint: 'Account Holder Name',
                  ),
                ),
                sizedBoxHeight20,
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFormField(
                    textEditingController: _accountNumber,
                    isPass: false,
                    hint: 'Bank Account Number',
                  ),
                ),
                sizedBoxHeight20,
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFormField(
                    textEditingController: _ifscCode,
                    isPass: false,
                    hint: 'IFSC Code',
                  ),
                ),
                sizedBoxHeight20,
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFormField(
                    textEditingController: _branchName,
                    isPass: false,
                    hint: 'Branch Name',
                  ),
                ),
                sizedBoxHeight20,
                sizedBoxHeight20,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFEEEEEE),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Ex.Prasanna.ICICI@YBL',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
