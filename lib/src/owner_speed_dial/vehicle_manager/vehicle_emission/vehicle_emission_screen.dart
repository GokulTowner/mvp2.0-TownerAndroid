import '../../../../imports.dart';

class VehicleEmissionScreen extends StatelessWidget {
  const VehicleEmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle Emission'),
              Consumer<VehicleEmissionProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        CustomDropdowneEmissionWidget(
                          hint: 'Emission',
                          dataList: provider.emissionList,
                          selectedValue: provider.selectedemission,
                        ),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.vehicleNumber,
                            isPass: false,
                            hint: 'Vehicle Number as in Emission Document'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.emissionNumber,
                            isPass: false,
                            hint: 'Emission Number'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                          textEditingController: provider.expiryDate,
                          isPass: false,
                          hint: 'Expiry Date',
                          suffixIcon: IconButton(
                              onPressed: () {
                                provider.showDatePickerEmission(context);
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ),
                        sizedBoxHeight30,
                        const ImageContainerEmission(),
                        const SizedBox(
                          height: 30,
                        ),
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
