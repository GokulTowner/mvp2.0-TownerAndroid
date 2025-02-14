import '../../../../imports.dart';

class VehiclePermitScreen extends StatelessWidget {
  const VehiclePermitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle Permit'),
              Consumer<VehiclePermitProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        CustomDropdownPermitWidget(
                          hint: 'Permit',
                          dataList: provider.permitList,
                          selectedValue: provider.selectedpermit,
                        ),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.vehicleNumber,
                            isPass: false,
                            hint: 'Vehicle Number as in Permit Document'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.permitNumber,
                            isPass: false,
                            hint: 'Permit Number'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                          textEditingController: provider.expiryDate,
                          isPass: false,
                          hint: 'Expiry Date',
                          suffixIcon: IconButton(
                              onPressed: () {
                                provider.showDatePickerPermit(context);
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ),
                        sizedBoxHeight30,
                        const ImageContainerPermit(),
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
