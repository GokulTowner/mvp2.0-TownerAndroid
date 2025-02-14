import '../../../../imports.dart';

class IntripMapScreen extends StatefulWidget {
  const IntripMapScreen({super.key});

  @override
  _IntripMapScreen createState() => _IntripMapScreen();
}

class _IntripMapScreen extends State<IntripMapScreen> {
  late GoogleMapController mapController;

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(12.912647, 77.588913),
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    final intripProvider = context.watch<IntripProvider>();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                mapController.animateCamera(
                    CameraUpdate.newCameraPosition(_kInitialPosition));
              },
              initialCameraPosition: _kInitialPosition,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      IconButton(
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                          color: cDarkBlack,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteClass.notificationScreen);
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                if (intripProvider.intrip == true)
                  const IntripContainer()
                else
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                    child: RideEndedContainer(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
