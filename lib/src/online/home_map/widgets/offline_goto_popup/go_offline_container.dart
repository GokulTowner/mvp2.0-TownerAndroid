import 'package:townerapp/method_channel/background_location_service/background_location_service.dart';
import 'package:townerapp/method_channel/floating_service/floating_icon_service.dart';

import '../../../../../imports.dart';

class GoOffline extends StatelessWidget {
  const GoOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.9,
          widthFactor: 1.1,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cWhiteColor,
                ),
                child: Padding(
                  padding: pPagePadding_8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedBoxHeight15,
                      Text(
                        'Are You Sure!',
                        style: TextStyle(
                          color: cDarkBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      sizedBoxHeight20,
                      Image.asset('assets/images/alert1.png'),
                      sizedBoxHeight30,
                      const Text(
                        'This makes you offline from our services and you will not get any trips from us and will be considered you are unavailable.',
                        style: TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      sizedBoxHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              context
                                  .read<BottomNavigationProvider>()
                                  .setIndex(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFa8a8a8),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              BackgroundLocationService.stopLocationService();
                              LocalStorageService().removeLastVisitedScreen();
                              // stopBackgroundService();
                              context
                                  .read<HomeMapProvider>()
                                  .stopLocationUpdates();

                              context
                                  .read<HomeMapProvider>()
                                  .setOnlineStatus(false);
                                  FloatingIconService().stopFloatingIconService();

                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RouteClass.landingScreenDriver,
                                  (route) => true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cBackgroundGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: Center(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
