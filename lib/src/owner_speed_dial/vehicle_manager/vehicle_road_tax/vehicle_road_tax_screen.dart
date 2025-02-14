import '../../../../imports.dart';

class VehicleRoadTaxScreen extends StatelessWidget {
  const VehicleRoadTaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle Road Tax'),
              Consumer<VehicleRoadTaxProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        CustomDropdownRoadTaxWidget(
                          hint: 'roadTax',
                          dataList: provider.roadTaxList,
                          selectedValue: provider.selectedroadTax,
                        ),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.vehicleNumber,
                            isPass: false,
                            hint: 'Vehicle Number as in roadTax Document'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.roadTaxNumber,
                            isPass: false,
                            hint: 'roadTax Number'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                          textEditingController: provider.expiryDate,
                          isPass: false,
                          hint: 'Expiry Date',
                          suffixIcon: IconButton(
                              onPressed: () {
                                provider.showDatePickerroadTax(context);
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ),
                        sizedBoxHeight30,
                        const ImageContainerRoadTax(),
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
