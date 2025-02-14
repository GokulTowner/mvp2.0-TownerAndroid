import '../../../../../imports.dart';

class SelectRtoDropdown extends StatelessWidget {
  const SelectRtoDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final driverLicenseProviderWatch = context.watch<DriverLicenseProvider>();
    final driverLicenseProvider =
        Provider.of<DriverLicenseProvider>(context, listen: false);

    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.059,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 10),
          child: DropdownButton<String>(
            elevation: 5,
            isExpanded: true,
            focusColor: Colors.green,
            value: driverLicenseProviderWatch.selectedRto ?? 'Select RTO',
            onChanged: driverLicenseProviderWatch.isReadOnly
                ? null
                : (value) {
                    driverLicenseProvider.updateRto(value);
                  },
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xFFEEEEEE),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            items: const [
              DropdownMenuItem(
                value: 'Select RTO',
                child: Text(
                  'Select RTO',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'RTO Bangalore',
                child: Text(
                  'RTO Bangalore',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'RTO Mangalore',
                child: Text(
                  'RTO Mangalore',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'RTO Chenni',
                child: Text(
                  'RTO Chenni',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'RTO Kochi',
                child: Text(
                  'RTO Kochi',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
