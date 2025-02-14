import '../../../../../imports.dart';

class VehicleContainer extends StatelessWidget {
  const VehicleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProfileProvider>(
      builder: (context, vehicleProfileProvider, child) {
        List<VehicleDetailsModel> vehicleDetailsList =
            vehicleProfileProvider.vehicleDetailsList;
        return ListView.builder(
          itemCount: vehicleDetailsList.length,
          itemBuilder: (context, index) {
            VehicleDetailsModel vehicleDetails = vehicleDetailsList[index];
            return Card(
              color: cLightGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: cTransparent,
                      foregroundColor: cTransparent,
                      backgroundImage: NetworkImage(vehicleDetails.vehImage),
                    ),
                    title: Text(
                      ' ${vehicleDetails.model}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      ' ${vehicleDetails.vehicleType}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: SizedBox(
                      width: 82,
                      child: Row(
                        children: [
                          Text(vehicleDetails.docStatus),
                          sizedBoxWidth5,
                          Icon(
                            Icons.info,
                            color: vehicleDetails.docStatus == sRejected
                                ? Colors.red
                                : vehicleDetails.docStatus == sPending
                                    ? Colors.orange
                                    : vehicleDetails.docStatus == sApproved
                                        ? Colors.green
                                        : Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddVehicleScreen(
                            flag: 1,
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 6,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)!.rc} : ${vehicleDetails.rc}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            vehicleDetails.driver != ""
                                ? Text(
                                    '${AppLocalizations.of(context)!.driver} : ${vehicleDetails.driver}')
                                : Text(
                                    AppLocalizations.of(context)!.noDriver,
                                    style: TextStyle(color: cBloodRed),
                                  )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<VehicleSettingsProvider>()
                                  .setVehId(vehicleDetails.vehicleId);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VehicleSettingsScreenOwner(
                                            vehId: vehicleDetails.vehicleId),
                                  ));
                            },
                            icon: const Icon(
                              Icons.settings,
                              size: 30,
                            )),
                        OutlinedButton(
                          onPressed: () {
                            if (vehicleDetails.docStatus == sApproved) {
                              showAssignDriverDialog(context, vehicleDetails);
                            } else {
                              flutterToastFailShort(
                                vehicleDetails.docStatus != sRejected
                                    ? '${AppLocalizations.of(context)!.unableToAssignDriverAsTheVehicleIsStill} ${vehicleDetails.docStatus}'
                                    : '${AppLocalizations.of(context)!.unableToAssignDriverAsTheVehicleIs} ${vehicleDetails.docStatus}',
                                14,
                              );
                            }
                          },
                          child: vehicleDetails.driver == ""
                              ? Text(
                                  AppLocalizations.of(context)!.assignDriver,
                                  style: TextStyle(color: cBackgroundGreen),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.changeDriver,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showAssignDriverDialog(
      BuildContext context, VehicleDetailsModel vhehicleDetails) {
    final vehicleProfileProvider = context.read<VehicleProfileProvider>();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.assignDriver), // Heading
          // Content of the AlertDialog
          content: Consumer<DriverProfileProvider>(
            builder: (context, driverProfileProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                // Dropdown button for selecting the driver
                children: [
                  DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(15),
                    items: driverProfileProvider.driverProfileList
                        .map(
                          (DriverProfileModel value) =>
                              DropdownMenuItem<String>(
                            value: value.driverId,
                            child: Text(value.driverName),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue == null) return;
                      vehicleProfileProvider.setAssignedDriver(newValue);
                      // Implement your logic for when a driver is selected
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.selectDriver,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Actions (Cancel and Assign buttons)
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                flutterToastSuccessLong(
                    '${AppLocalizations.of(context)!.theDriver} ${vehicleProfileProvider.selectedDriver} ${AppLocalizations.of(context)!.successfullyAssignedTo} ${vhehicleDetails.model} ${AppLocalizations.of(context)!.vehicleNo} : ${vhehicleDetails.rc}',
                    14);

                // Implement your logic for assignIng the driver
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(AppLocalizations.of(context)!.assign),
            ),
          ],
        );
      },
    );
  }
}
