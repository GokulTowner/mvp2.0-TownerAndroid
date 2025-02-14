import '../../../../imports.dart';

class PassbookAndChequeScreen extends StatelessWidget {
  const PassbookAndChequeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passbookAndChequeProvider =
        Provider.of<PassbookAndChequeProvider>(context, listen: false);
    final passbookAndChequeProviderWatch =
        context.watch<PassbookAndChequeProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight20,
              const CustomHeader(title: 'Passbook Or Cancelled Cheque'),
              sizedBoxHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile<int>(
                      title: const Text('Passbook'),
                      value: 0,
                      activeColor: cDarkBlack,
                      groupValue: passbookAndChequeProviderWatch.selectedOption,
                      onChanged: (value) {
                        passbookAndChequeProvider.radioButtonValue = value!;
                        passbookAndChequeProvider.setSelectedOption(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<int>(
                      title: const Text(
                        'Cancelled Cheque',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      value: 1,
                      activeColor: cDarkBlack,
                      groupValue: passbookAndChequeProviderWatch.selectedOption,
                      onChanged: (value) {
                        passbookAndChequeProvider.radioButtonValue = value!;
                        passbookAndChequeProvider.setSelectedOption(value);
                      },
                    ),
                  ),
                ],
              ),
              const Text(
                'Upload Documents',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              sizedBoxHeight20,
              const ImageContainerPassboodOrCheque(),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}
