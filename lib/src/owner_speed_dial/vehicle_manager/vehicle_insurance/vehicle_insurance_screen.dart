import '../../../../imports.dart';

class VehicleInsuranceScreen extends StatelessWidget {
  const VehicleInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle Insurance'),
              Consumer<VehicleInsuranceProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        CustomDropdownInsuranceWidget(
                          hint: 'Insurance Provider',
                          dataList: provider.insuranceProviderList,
                          selectedValue: provider.selectedInsurance,
                        ),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.vehicleNumber,
                            isPass: false,
                            hint: 'Vehicle Number as in Insurance Document'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.policyNumber,
                            isPass: false,
                            hint: 'Policy Number'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                          textEditingController: provider.expiryDate,
                          isPass: false,
                          hint: 'Expiry Date',
                          suffixIcon: IconButton(
                              onPressed: () {
                                provider.showDatePickerInsurance(context);
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ),
                        sizedBoxHeight30,
                        const ImageContainerInsurance(),
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
