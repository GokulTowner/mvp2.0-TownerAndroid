import '../../../../../imports.dart';

class DriverProfileWidget extends StatelessWidget {
  final List<DriverProfileModel> driverProfileList;
  final int index;
  final String driverName;
  final String carModel;
  final String? vehicleNumber;
  final String profileImageAsset;
  final double driverRating;
  final String status;

  const DriverProfileWidget(
      {super.key,
      required this.driverProfileList,
      required this.index,
      required this.driverName,
      required this.carModel,
      this.vehicleNumber,
      required this.profileImageAsset,
      required this.driverRating,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: cLightGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profileImageAsset),
              radius: 30,
            ),
            title: Text(
              driverName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(
                  ' $driverRating',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            trailing: SizedBox(
              width: 82,
              child: Row(
                children: [
                  Text(status),
                  sizedBoxWidth5,
                  Icon(
                    Icons.info,
                    color: status == AppLocalizations.of(context)!.rejected
                        ? Colors.red
                        : status == AppLocalizations.of(context)!.pending
                            ? Colors.orange
                            : status == AppLocalizations.of(context)!.approved
                                ? Colors.green
                                : Colors.blue,
                  ),
                ],
              ),
            ),
            onTap: () {
              final addDriveverProvider = context.read<AddDriverProvider>();
              addDriveverProvider.getDriverDetailsForViewAndEditOwner(
                  index, driverProfileList);
              addDriveverProvider.setIsReadOnly(true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddDriverScreen(
                    isDriverProfile: true,
                    driverProfile: driverProfileList[index],
                  ),
                ),
              );
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${AppLocalizations.of(context)!.carModel} : $carModel',
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      '${AppLocalizations.of(context)!.vehicleno}: ${vehicleNumber ?? AppLocalizations.of(context)!.noVehicle}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedBoxHeight15,
        ],
      ),
    );
  }
}
