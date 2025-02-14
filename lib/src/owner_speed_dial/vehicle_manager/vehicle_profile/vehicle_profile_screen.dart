import '../../../../imports.dart';

class VehicleProfilesScreen extends StatelessWidget {
  const VehicleProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteClass.addvehiclescreen1);
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
              CustomHeader(
                title: AppLocalizations.of(context)!.vehicleProfiles,
              ),
              sizedBoxHeight20,
              const Expanded(child: VehicleContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
