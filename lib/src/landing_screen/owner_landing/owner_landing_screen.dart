import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../imports.dart';

class LandingScreenOwner extends StatelessWidget {
  final bool? isOwner;
  LandingScreenOwner({this.isOwner, super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SubscriptionProvider subscriptionProvider = SubscriptionProvider();

  @override
  Widget build(BuildContext context) {
    // // driver profile and vehicle profile loading the data from here
    // // then only when the desired screen is open the data will shown there
    // DriverProfileProvider();
    // VehicleProfileProvider();
    final loginProviderWatch = context.watch<LoginProvider>();
    final ownerLandingProvider = context.read<OwnerLandingProvider>();
    return Scaffold(
      floatingActionButton: loginProviderWatch.isOwner == true
          ? SpeedDial(
              tooltip: 'Select Your Choice',
              backgroundColor: cMainGreen,
              children: [
                SpeedDialChild(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteClass.driverprofilescreen);
                  },
                  backgroundColor: cBackgroundBlack,
                  label: AppLocalizations.of(context)!.manageDrivers,
                  child: Icon(
                    Icons.person,
                    color: cMainGreen,
                  ),
                ),
                SpeedDialChild(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteClass.vehicleprofilesscreen);
                  },
                  backgroundColor: cBackgroundBlack,
                  label: AppLocalizations.of(context)!.manageVehicles,
                  child: Tooltip(
                    message: 'Select the icon to open vehicle profile',
                    child: Icon(
                      Icons.drive_eta_rounded,
                      color: cMainGreen,
                    ),
                  ),
                ),
                SpeedDialChild(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteClass.buysubscriptionscreen);
                  },
                  backgroundColor: cBackgroundBlack,
                  label: AppLocalizations.of(context)!.manageSubscriptions,
                  child: Icon(
                    Icons.monetization_on_rounded,
                    color: cMainGreen,
                  ),
                ),
              ],
              activeChild: Icon(
                Icons.close,
                color: cDarkBlack,
                size: iIconSize_36,
              ),
              child: Icon(
                Icons.add,
                color: cDarkBlack,
                size: iIconSize_40,
              ),
            )
          : sizedBoxHeight0,
      key: _scaffoldKey,
      drawer: DrawerWidget(
        isOwner: loginProviderWatch.isOwner,
      ),
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
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: iIconSize_32,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.notificationScreen);
                    },
                  )
                ],
              ),
              Padding(
                padding: pPaddingVertical_20,
                child: Image.asset(imgLogo2),
              ),
              Text(
                AppLocalizations.of(context)!.welcomeToTravelAgencyOwner,
                style: tsLargeTextBold,
              ),
              sizedBoxHeight40,
              sizedBoxHeight20,
              CarouselSlider(
                options: CarouselOptions(
                  height: 260.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                ),
                items: ownerLandingProvider.imageUrls.map(
                  (url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: cWhiteColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            url,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
              Padding(
                padding: pPagePadding_10,
                child: Text(
                  '${AppLocalizations.of(context)!.reachUs} @ 080 (6846) 4799',
                  style: tsRegularTextWithColorGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildNumberCircle(int number) {
  //   return Container(
  //     width: 35,
  //     height: 35,
  //     decoration: BoxDecoration(
  //       color: cMainGreen,
  //       shape: BoxShape.circle,
  //     ),
  //     child: Center(
  //       child: Text('0$number', style: tsRegularText),
  //     ),
  //   );
  // }
}
