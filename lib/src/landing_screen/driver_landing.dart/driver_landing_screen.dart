// import 'package:townerapp/background_location_service/background_location_service.dart';

import 'dart:developer';

import 'package:townerapp/method_channel/background_location_service/background_location_service.dart';
import 'package:townerapp/method_channel/floating_service/floating_icon_service.dart';
import 'package:townerapp/models/driver_login_modal.dart';

import '../../../imports.dart';

class LandingScreenDriver extends StatelessWidget {
  LandingScreenDriver({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final homeProvider = Provider.of<HomeMapProvider>(context);
    context.read<LoginProvider>().getDriverInfo(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: iIconSize_32,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: cDarkBlack,
                      size: iIconSize_32,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(imgLogo2),
              ),
              Text(AppLocalizations.of(context)!.welcomeToTowner,
                  style: tsLargeText),
              sizedBoxHeight15,
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  DriverData driverData = provider.driverData ??
                      DriverData();
                  return Padding(
                    padding: pPaddingHorizontal_45,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(rRadius_10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(rRadius_10),
                          color: cBackgroundWhite,
                        ),
                        child: Column(
                          children: [
                            sizedBoxHeight10,
                            CircularPercentIndicator(
                              center: SizedBox(
                                width: 150,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      75), // Half of the width/height for circular shape
                                  child: driverData.profile?.userProfile?.profileurl != null
                                      ? Image.network(
                                    "https://www.cgg.gov.in/wp-content/uploads/2017/10/dummy-profile-pic-male1.jpg",
                                          fit: BoxFit
                                              .cover, // Adjust fit as per your preference (cover, contain, etc.)
                                        )
                                      : Image.asset(
                                          imgDp3,
                                          fit: BoxFit
                                              .cover, // Adjust fit as per your preference (cover, contain, etc.)
                                        ),
                                ),
                              ),
                              radius: 85,
                              progressColor: cMainGreen,
                              lineWidth: 10,
                              percent: 0.2,
                              backgroundColor: cFadeColor,
                            ),
                            sizedBoxHeight10,
                            Text(
                              'Hey, ${driverData.name}',
                              style: tsLargeTextBold,
                            ),
                            sizedBoxHeight10,
                            Text(
                                '${driverData.code} | -',
                                style: tsMediumTextWithColorDarkGrey),
                            sizedBoxHeight10,
                            Padding(
                              padding: pPaddingHorizontal_12,
                              child: CustomButton(
                                onTap: () {
                                  WidgetsBinding.instance.addPostFrameCallback(
                                    (_) {
                                      Navigator.pushNamed(context,
                                          RouteClass.editProfileScreen);
                                    },
                                  );
                                },
                                title: AppLocalizations.of(context)!.updateNow,
                                optionalColor: cDarkBlack,
                                optionalTextColor: cLightWhite,
                              ),
                            ),
                            sizedBoxHeight10,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: pPaddingVertical_10,
                child: Text(
                  '${AppLocalizations.of(context)!.reachUs} @ 080 (6846) 4799',
                  style: tsRegularTextWithColorGrey,
                ),
              ),
              sizedBoxHeight40,
              // ElevatedButton(
              //     onPressed: () {
              //       BackgroundLocationService.startLocationService();
              //     },
              //     child: const Text('Start background service')),
              // sizedBoxHeight20,
              // ElevatedButton(
              //     onPressed: () {
              //       BackgroundLocationService.stopLocationService();
              //     },
              //     child: const Text('Stop background service')),
              // sizedBoxHeight20,
              CustomButton(
                onTap: () async {


                  var homeProvider = context.read<HomeMapProvider>();

                  bool? isAccepted = await homeProvider.isProfStatusAccepted();

                  if(isAccepted==false || isAccepted== null){
                    Fluttertoast.showToast(msg: 'Pending for Admin Approval');
                    return;
                  }


                  homeProvider.setOnlineStatus(true);
                  FloatingIconService().stopFloatingIconService();

                  // restartBackgroundService();
                  BackgroundLocationService.startLocationService();
                  // await homeProvider.updateLocation();
                  FloatingIconService().startFloatingIconService();
                  context.read<BottomNavigationProvider>().setIndex(2);


                  LocalStorageService();
                  LocalStorageService()
                      .navigateToNextScreen(context, RouteClass.homeScreen);
                },
                title: AppLocalizations.of(context)!.goOnline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
