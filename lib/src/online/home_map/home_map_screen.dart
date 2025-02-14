import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import '../../../imports.dart';
import '../../edit_profile/vehicle_profile_driver/model/vehicle_list_modal.dart';

class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});

  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  // GoogleMapController? mapController;
  Timer? locationTimer;



  @override
  void initState() {
    super.initState();
    Provider.of<HomeMapProvider>(context, listen: false)
        .loadMarkerIcon(); // Load the marker icon



    Provider.of<HomeMapProvider>(context, listen: false).getCurrentLocationFromFirebase();
    Provider.of<HomeMapProvider>(context, listen: false).startLocationUpdates();


  }


  @override
  void dispose() {
    if (locationTimer != null) {
      locationTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = context.watch<BottomNavigationProvider>();
    HomeMapProvider(context: context);
    
    return Scaffold(
      body: Consumer<HomeMapProvider>(
        builder: (context, homeMapProvider, _) {
          LatLng? latestLocation = homeMapProvider.latestLocation;
          homeMapProvider.getInitialCurrentLocation();

          return SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    homeMapProvider.mapController = controller;
                    if (latestLocation != null &&
                        homeMapProvider.markerIcon != null) {
                      homeMapProvider.mapController!.animateCamera(
                        CameraUpdate.newLatLngZoom(
                          latestLocation,
                          16.0,
                        ),
                      );
                    }
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(13.912647, 77.58), // Default location
                    zoom: 14.0,
                  ),
                  markers: {
                    if (latestLocation != null &&
                        homeMapProvider.markerIcon != null)
                      Marker(
                        markerId: const MarkerId('car_marker'),
                        position: latestLocation,
                        icon: BitmapDescriptor.fromBytes(
                            homeMapProvider.markerIcon!),
                      ),
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_active_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/notification_screen',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          changeTaxiWidget(homeMapProvider),
                          Card(
                            child: IconButton(
                              icon: const Icon(
                                Icons.my_location,
                                size: 30,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                homeMapProvider.getInitialCurrentLocation();
                               
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                    bottomNavProvider.currentIndex == 2
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            // child: InkWell(
                            //   onTap: () {
                            //     showModalBottomSheet(
                            //       context: context,
                            //       isScrollControlled: true,
                            //       builder: (context) {
                            //         return DraggableScrollableSheet(
                            //           expand: false,
                            //           initialChildSize: .45,
                            //           minChildSize: .2,
                            //           maxChildSize: 1,
                            //           builder: (context, scrollController) {
                            //             return const MainHomeContainer();
                            //           },
                            //         );
                            //       },
                            //     );
                            //   },
                            //   child: Container(
                            //     width: double.infinity,
                            //     height: 45,
                            //     decoration: BoxDecoration(
                            //       color: Colors.black,
                            //       borderRadius: BorderRadius.circular(5),
                            //     ),
                            //     child: const Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           'Tap to open',
                            //           style: TextStyle(
                            //             color: Colors.green,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 17,
                            //           ),
                            //         ),
                            //         SizedBox(width: 5),
                            //         Icon(
                            //           Icons.arrow_upward,
                            //           color: Colors.green,
                            //           size: 26,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          )
                        : bottomNavProvider.currentIndex == 1 &&
                                bottomNavProvider.isGotoHome == true
                            ? const SizedBox(
                                height: 170,
                                child: CancelGotoWaiting(),
                              )
                            : bottomNavProvider.currentIndex == 3
                                ? const SizedBox(
                                    height: 500,
                                    child: More(),
                                  )
                                : sizedBoxHeight0
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const ReusableBottomBar(),
    );
  }

  changeTaxiWidget(HomeMapProvider provider) {

    return FutureBuilder<DatabaseEvent>(
      future: provider.vehicleDatabase,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {

      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator());
      }


      if(snapshot.hasError){
        return const SizedBox();
      }


      if(snapshot.hasData){
        var data = snapshot.data?.snapshot.value;

        if(data!=null){
          log("found vehicle id :- $data");
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: FloatingActionButton.extended(onPressed: (){

              if(provider.taxiList?.isEmpty??true){
                return ;
              }


              var selectedVehicle = provider.taxiList!.singleWhere((ev)=>ev.id==data);


              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: const Icon(Icons.car_rental),
                      title: const Text('Select Your Vehicle'),
                      content: SingleChildScrollView(
                        child: Column(
                          children: provider.taxiList!.map((vehicle) {
                            return RadioListTile<VehicleListModal>(
                              title: Text("${vehicle.makename ?? ''} (${vehicle.vehicletype ?? ''})"),
                              value: vehicle,
                              groupValue: selectedVehicle,
                              onChanged: (value) {
                                if (value == null) return;
                                Navigator.of(context).pop(); // Close the dialog
                                provider.setPrimary(value.id!);

                                  },
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  });


            }, label: const Text('Change Taxi'),
            ),
          );
        }else{
          return const SizedBox();
        }

      }else{
        return const SizedBox();
      }

    }, );
  }
  }

