import '../../../../imports.dart';

class OwnerAdharScreen extends StatelessWidget {
  const OwnerAdharScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Adhar Number'),
              Consumer<OwnerAdharProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.adharNumber,
                            isPass: false,
                            hint: 'Enter Adhar Number'),
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        const ImageContainerAdhar(),
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
