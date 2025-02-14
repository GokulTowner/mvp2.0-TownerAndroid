import '../../../../imports.dart';

class VehicleRcScreen extends StatelessWidget {
  const VehicleRcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle RC'),
              Consumer<VehicleRcProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Padding(
                      padding: pPaddingHorizontal_12,
                      child: Column(
                        children: [
                          sizedBoxHeight20,
                          CustomDropdownRcWidget(
                            hint: 'RC',
                            dataList: provider.rcList,
                            selectedValue: provider.selectedrc,
                          ),
                          sizedBoxHeight30,
                          CustomTextFormField(
                              textEditingController: provider.vehicleNumber,
                              isPass: false,
                              hint: 'Vehicle Number as in Rc Document'),
                          sizedBoxHeight30,
                          CustomTextFormField(
                              textEditingController: provider.rcNumber,
                              isPass: false,
                              hint: 'Rc Number'),
                          sizedBoxHeight30,
                          CustomTextFormField(
                            textEditingController: provider.expiryDate,
                            isPass: false,
                            hint: 'Expiry Date',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.showDatePickerRc(context);
                                },
                                icon:
                                    const Icon(Icons.calendar_month_outlined)),
                          ),
                          sizedBoxHeight30,
                          const ImageContainerRc(),
                          sizedBoxHeight30,
                          CustomButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: 'Save')
                        ],
                      ),
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
