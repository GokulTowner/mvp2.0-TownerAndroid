import '../../../../imports.dart';

class RaiseNewTicketScreen extends StatelessWidget {
  const RaiseNewTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final driverProfileProvider =
    //     Provider.of<DriverProfileProvider>(context, listen: false);
    final driverProfileProviderWatch = context.watch<DriverProfileProvider>();
    final vehicleProfileProviderWatch = context.read<VehicleProfileProvider>();
    final raiseNewTicketProvider =
        Provider.of<RaiseNewTicketProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_16,
            child: Consumer<RaiseNewTicketProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.raiseNewTicket),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton(
                          value: provider.selectedDriver,
                          items: driverProfileProviderWatch.driverProfileList
                              .map((DriverProfileModel value) {
                            return DropdownMenuItem(
                              value: value.driverId,
                              child: Text(value.driverName),
                            );
                          }).toList(),
                          onChanged: (value) {
                            raiseNewTicketProvider.setSelectedDriver(value);
                          },
                          hint:
                              Text(AppLocalizations.of(context)!.selectDriver),
                        ),
                        DropdownButton(
                          value: raiseNewTicketProvider.selectedVehicle,
                          items: vehicleProfileProviderWatch.vehicleDetailsList
                              .map(
                            (VehicleDetailsModel value) {
                              return DropdownMenuItem(
                                value: value.vehicleId,
                                child: Text(value.rc),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            raiseNewTicketProvider.setSelectedVehicle(value);
                          },
                          hint:
                              Text(AppLocalizations.of(context)!.selectVehicle),
                        ),
                      ],
                    ),
                    const Divider(),
                    sizedBoxHeight30,
                    const CustomDropdownButtonAppIssue(),
                    sizedBoxHeight30,
                    TextField(
                      controller: raiseNewTicketProvider.commentController,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.comment,
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.grey),
                      minLines: 7,
                      maxLines: 7,
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      color: const Color(0xFFEEEEEE),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                AppLocalizations.of(context)!.uploadImage,
                                style: const TextStyle(
                                    color: Color(0xFFa8a8a8), fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Browse button functionality
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cBackgroundGreen,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.browse,
                                style: TextStyle(
                                  color: cDarkBlack,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        onTap: () {
                          raiseNewTicketProvider.submitTicket();
                          Navigator.pop(context);
                        },
                        title: AppLocalizations.of(context)!.submitTicket),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
