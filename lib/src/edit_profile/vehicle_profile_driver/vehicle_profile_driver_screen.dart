import '../../../imports.dart';
import 'add_vehicle/add_vehicle_controller.dart';
import 'add_vehicle/manage_vehicles_screen.dart';

class VehicleProfileDriverScreen extends StatelessWidget {
  const VehicleProfileDriverScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CreateVehicleProvider>(context, listen: false);
    provider.init();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<VehicleProfileDriverProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CustomHeader(
                    title: 'Vehicle Profile',
                    isOption: true,
                    widgets: IconButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ManageVehiclesScreen()),
                        );
                        provider.fetchVehicleDetails();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  sizedBoxHeight20,

                  Expanded(child: ListView.builder(
                    itemCount: provider.taxiList?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      var modal = provider.taxiList![index];

                      return Column(
                        children: [

                          modal.image != ''
                              ? Image.network(modal.image!)
                              : sizedBoxHeight10,
                          Card(
                            color: cGreyColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vehicle Make : ${modal.makename}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                      'Model : ${modal.model}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text(
                                      'Vehicle Status : ${modal.taxistatus}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text('RC : ${modal.licence}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text('Year : ${modal.year}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  sizedBoxHeight5,

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          modal.taxistatus == "active"
                                              ? null
                                              : provider.setPrimary(
                                              modal.id ?? '');
                                        },
                                        child: Container(
                                          padding: pPagePadding_8,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),

                                          child: Text(
                                              modal.taxistatus == "active"
                                                  ? "Primary"
                                                  : "Set as a Primary",

                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: cWhiteColor) ,
                                          ),
                                        ),
                                      ),

                                      sizedBoxHeight20,

                                      InkWell(
                                        onTap: (){
                                          provider.deleteTaxi(modal.id??'');
                                        },
                                        child: Container(
                                          padding: pPagePadding_8,
                                          decoration: BoxDecoration(
                                            color:  cBloodRed,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: cWhiteColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                  },
                  ))

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
