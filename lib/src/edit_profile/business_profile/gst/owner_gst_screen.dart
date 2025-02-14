import '../../../../imports.dart';

class OwnerRcNumberScreen extends StatelessWidget {
  const OwnerRcNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'GST Number'),
              Consumer<GstProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.gstNumber,
                            isPass: false,
                            hint: 'Enter GST number'),
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        const ImageContainerGst(),
                        sizedBoxHeight30,
                        CustomButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: 'Save')
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
