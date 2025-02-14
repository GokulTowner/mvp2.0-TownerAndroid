import '../../../../imports.dart';

class VehicleFitnessScreen extends StatelessWidget {
  const VehicleFitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(title: 'Vehicle Fitness Certificate'),
              Consumer<VehicleFitnessProvider>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: pPaddingVertical_8,
                    child: Column(
                      children: [
                        sizedBoxHeight30,
                        CustomDropdownFitnessWidget(
                          hint: 'Fitness',
                          dataList: provider.fitnessList,
                          selectedValue: provider.selectedFitness,
                        ),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.vehicleNumber,
                            isPass: false,
                            hint: 'Vehicle Number as in Fitness Document'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                            textEditingController: provider.fitnessNumber,
                            isPass: false,
                            hint: 'Fitness Number'),
                        sizedBoxHeight30,
                        CustomTextFormField(
                          textEditingController: provider.expiryDate,
                          isPass: false,
                          hint: 'Expiry Date',
                          suffixIcon: IconButton(
                              onPressed: () {
                                provider.showDatePickerFitness(context);
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ),
                        sizedBoxHeight30,
                        const ImageContainerFitness(),
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
