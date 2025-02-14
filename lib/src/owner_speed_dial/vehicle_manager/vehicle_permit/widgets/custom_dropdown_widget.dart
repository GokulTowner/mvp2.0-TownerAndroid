import '../../../../../imports.dart';

class CustomDropdownPermitWidget extends StatelessWidget {
  final String? itemType;
  final String? selectedValue;
  final String hint;
  final List<dynamic>? dataList;
  const CustomDropdownPermitWidget(
      {required this.hint,
      this.dataList,
      this.selectedValue,
      this.itemType,
      super.key});

  @override
  Widget build(BuildContext context) {
    final vehicleInsuranceProvider =
        Provider.of<VehiclePermitProvider>(context, listen: false);
    // final addVehicleProviderWatch = context.watch<AddVehicleProvider>();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.07,
      width: width * 0.94,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: Center(
          child: DropdownButton<String>(
            hint: Text(hint),
            elevation: 5,
            isExpanded: true,
            value: selectedValue,
            onChanged: (value) {
              vehicleInsuranceProvider.updateSelectedValue(value);
            },
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xFFEEEEEE),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            items: dataList!
                .map((dynamic type) => DropdownMenuItem<String>(
                      value: type.toString(),
                      child: Text(type.toString()),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
