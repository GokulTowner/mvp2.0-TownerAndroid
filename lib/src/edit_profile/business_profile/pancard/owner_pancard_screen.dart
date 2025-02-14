import '../../../../imports.dart';

class OwnerPancardScreen extends StatelessWidget {
  const OwnerPancardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Pancard Number'),
              Consumer<OwnerPancardProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.pancardNumber,
                            isPass: false,
                            hint: 'Enter Pancard Number'),
                        sizedBoxHeight30,
                        sizedBoxHeight30,
                        const ImageContainerPancard(),
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
