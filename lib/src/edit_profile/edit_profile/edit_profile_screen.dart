import 'dart:developer';

import 'package:townerapp/models/driver_login_modal.dart';

import '../../../imports.dart';

class EditProfileScreen extends StatelessWidget {
  final bool? isOwner;
  EditProfileScreen({this.isOwner, super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AddDriverProvider();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Padding(
        padding: pPagePadding_16,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.notificationScreen);
                    },
                  )
                ],
              ),
              sizedBoxHeight20,
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  DriverData driverData = loginProvider.driverData ??
                      DriverData(
                          );

                  OwnerDataModel ownerData = loginProvider.owenrData ??
                      OwnerDataModel(
                          ownerId: '',
                          name: '',
                          phoneNumber: '',
                          docPercentage: 0,
                          totalVeh: 0,
                          totalDriver: 0);

                  log('Owner data : ${ownerData.agencyName}');

                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleContainer(
                            size: 40,
                            color: cDarkBlack,
                            child: loginProvider.isOwner
                                ? Text(
                                    '${ownerData.docPercentage * 100}%',
                                    style: TextStyle(color: cWhiteColor),
                                  )
                                : Text(
                                    '${0.2 * 100}%',
                                    style: TextStyle(color: cWhiteColor),
                                  ),
                          ),
                          const SizedBox(width: 5),
                          CircularPercentIndicator(
                            center: SizedBox(
                              width: 110,
                              height: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    50), // Half of the width/height for circular shape
                                child: loginProvider.isOwner
                                    ? ownerData.businessLogo != null
                                        ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              ownerData.businessLogo!,
                                            ),
                                          )
                                        : Image.asset(
                                            imgDp3,
                                            fit: BoxFit
                                                .cover, // Adjust fit as per your preference (cover, contain, etc.)
                                          )
                                    : driverData.profile?.userProfile?.profileurl != null
                                        ? const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              "https://www.cgg.gov.in/wp-content/uploads/2017/10/dummy-profile-pic-male1.jpg",
                                              // Adjust fit as per your preference (cover, contain, etc.)
                                            ),
                                          )
                                        : Image.asset(
                                            imgDp3,
                                            fit: BoxFit
                                                .cover, // Adjust fit as per your preference (cover, contain, etc.)
                                          ),
                              ),
                            ),
                            radius: 65,
                            progressColor: cMainGreen,
                            lineWidth: 10,
                            percent: loginProvider.isOwner
                                ? ownerData.docPercentage
                                : 0.2,
                            backgroundColor: cFadeColor,
                          ),
                          const SizedBox(width: 5),
                          CircleContainer(
                            size: 40,
                            color: cDarkBlack,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: cMainGreen,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight15,
                      Text(
                        loginProvider.isOwner
                            ? '${ownerData.agencyName}'
                            : 'Hey, ${driverData.name}',
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        loginProvider.isOwner
                            ? 'Vehicle : ${ownerData.totalVeh} | Driver : ${ownerData.totalDriver}'
                            : '${driverData.code} | -',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
              sizedBoxHeight10,
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cGreyColor,
                    ),
                    padding: pPagePadding_20,
                    child: Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<LoginProvider>().isOwner
                                  ? Navigator.pushNamed(
                                      context, RouteClass.businessstep1)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BusinessProfileDriverScreen(),
                                      ),
                                    );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Business Profile',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: cMainGreen,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Padding(
                                    padding: pPagePadding_4,
                                    child: Text('Active'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              if (context.read<LoginProvider>().isOwner) {
                                Navigator.pushNamed(
                                    context, RouteClass.driverprofilescreen);
                              } else {
                                context
                                    .read<AddDriverProvider>()
                                    .getDriverDetailsForViewAndEditDriver();

                                context
                                    .read<AddDriverProvider>()
                                    .setIsReadOnly(true);
                                Navigator.pushNamed(
                                    context, RouteClass.adddriverscreen);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Driver Profile',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Consumer<HomeMapProvider>(
                                    builder: (context, homeMapProvider, _) {



                                      return FutureBuilder<String?>(
                                          future: homeMapProvider.isProfStatusCheck(),
                                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {

                                            if(snapshot.connectionState == ConnectionState.waiting){
                                              return const Center(child: CircularProgressIndicator());
                                            }


                                            if(snapshot.hasError){
                                              return const SizedBox();
                                            }


                                            if(snapshot.connectionState == ConnectionState.done){

                                              return Container(
                                                decoration: BoxDecoration(
                                                color: snapshot.data ==
                                                        "Accepted"
                                                    ? Colors.green
                                                    : snapshot.data
                                                                ?.toLowerCase() ==
                                                            "rejected"
                                                        ? Colors.red
                                                        : Colors.yellow,
                                                borderRadius: BorderRadius.circular(5)),
                                                child: Padding(
                                                  padding: pPagePadding_4,
                                                  child: Text(
                                                    snapshot.data ?? 'NA',
                                                style: TextStyle(color: cWhiteColor),


                                                  ),
                                                ),
                                              );
                                            }

                                            return const SizedBox();

                                          }
                                      );
                                    }
                                )

                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<LoginProvider>().isOwner
                                  ? Navigator.pushNamed(
                                      context, RouteClass.vehicleprofilesscreen)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VehicleProfileDriverScreen(),
                                      ),
                                    );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Vehicle Profile',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Padding(
                                    padding: pPagePadding_4,
                                    child: Text(
                                      'Pending for approval',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<LoginProvider>().isOwner
                                  ? Navigator.pushNamed(
                                      context, RouteClass.bankaccountscreen)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BankAccountDriverScreen(),
                                      ),
                                    );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Bank Account',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: pPagePadding_4,
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(color: cWhiteColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  context.read<LoginProvider>().isOwner
                      ? Navigator.pushNamed(
                          context, RouteClass.landingScreenOwner)
                      : Navigator.pushNamed(
                          context, RouteClass.landingScreenDriver);
                },
                title: 'Go Home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
