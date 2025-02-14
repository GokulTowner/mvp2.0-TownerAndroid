import '../../../../imports.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddDriverProvider();
    DriverProfileProvider();
    Provider.of<DriverProfileProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AddDriverProvider>().clearAllForAddProfile();
          context.read<DriverLicenseProvider>().clearAllForAddProfile();
          context.read<DriverAadharCardProvider>().clearAllForAddProfile();
          context.read<DriverPancardProvider>().clearAllForAddProfile();
          context.read<DriverVoterIdProvider>().clearAllForAddProfile();
          context.read<DriverDisplayCardProvider>().clearAllForAddProfile();
          context.read<DriverPolicVarProvider>().clearAllForAddProfile();
          context.read<DriverUniqueIdProvider>().clearAllForAddProfile();

          context.read<AddDriverProvider>().setIsReadOnly(false);
          Navigator.pushNamed(context, RouteClass.adddriverscreen);
        },
        backgroundColor: cMainGreen,
        child: Icon(
          Icons.add,
          size: 40,
          color: cDarkBlack,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_12,
          child: Column(
            children: [
              CustomHeader(title: AppLocalizations.of(context)!.driverProfiles),
              sizedBoxHeight20,
              Expanded(
                child: Consumer<DriverProfileProvider>(
                  builder: (context, provider, child) {
                    List<DriverProfileModel> driverProfileList =
                        provider.driverProfileList;
                    return ListView.builder(
                      itemCount: driverProfileList.length,
                      itemBuilder: (context, index) {
                        DriverProfileModel driverProfile =
                            driverProfileList[index];
                        return DriverProfileWidget(
                          driverProfileList: driverProfileList,
                          index: index,
                          driverName: driverProfile.driverName,
                          carModel: driverProfile.linkedVehicleName,
                          vehicleNumber: driverProfile.linkedVehicleNumber,
                          profileImageAsset: driverProfile.driverPhoto,
                          driverRating: driverProfile.driverRating,
                          status: driverProfile.driverStatus,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
