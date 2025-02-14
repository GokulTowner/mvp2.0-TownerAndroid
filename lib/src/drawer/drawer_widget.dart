import 'package:townerapp/models/driver_info_modal.dart';
import 'package:townerapp/models/driver_login_modal.dart';

import '../../imports.dart';

class DrawerWidget extends StatelessWidget {
  final bool? isOwner;
  const DrawerWidget({this.isOwner, super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.watch<LoginProvider>();
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context, provider, child) {
              DriverInfoModal driverData = provider.driverInfoModal ??
                  DriverInfoModal(
                  );
              OwnerDataModel ownerData = provider.owenrData ??
                  OwnerDataModel(
                      ownerId: '',
                      name: '',
                      phoneNumber: '',
                      docPercentage: .0,
                      totalDriver: 0,
                      totalVeh: 0);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: eElevation_2,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: pPagePadding_16,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                center: SizedBox(
                                  width: 63,
                                  height: 63,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        30), // Half of the width/height for circular shape
                                    child: provider.isOwner
                                        ? ownerData.businessLogo != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  ownerData.image!,
                                                ),
                                              )
                                            : Image.asset(
                                                imgDp3,
                                                fit: BoxFit
                                                    .cover, // Adjust fit as per your preference (cover, contain, etc.)
                                              )
                                        : driverData.profileurl != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  driverData!.profileurl??'',
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
                                radius: 36,
                                progressColor: cMainGreen,
                                lineWidth: 10,
                                percent: loginProvider.isOwner
                                    ? ownerData.docPercentage
                                    : 0,
                                backgroundColor: cFadeColor,
                              ),
                              sizedBoxHeight10,
                              provider.isOwner
                                  ? Text('${ownerData.docPercentage * 100}%')
                                  : const Text('${0.2 * 100}%')
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                provider.isOwner
                                    ? Text('${ownerData.agencyName}',
                                        style: tsRegularTextBold)
                                    : Text('Hey,  ${driverData.fname}',
                                        style: tsRegularTextBold),
                                sizedBoxHeight5,
                                provider.isOwner
                                    ? Text(
                                        'Vehicle : ${ownerData.totalVeh} | Driver : ${ownerData.totalDriver}',
                                        style: tsSmallTextGrey)
                                    : Text(
                                        '${driverData.curVehicleNo} |- ',
                                        style: tsSmallTextGrey),
                                sizedBoxHeight10,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: pPadding_70),
                                  child: CustomButton(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfileScreen(
                                                  isOwner: isOwner),
                                        ),
                                      );
                                    },
                                    title: AppLocalizations.of(context)!
                                        .editProfile,
                                    textSize: 14,
                                    optionalHeight: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DrawerWidgetTile(
                    icon: Icons.subscriptions,
                    text: AppLocalizations.of(context)!.mySubscriptions,
                    trailing: Text(
                      AppLocalizations.of(context)!.free,
                      style: tsRgularGreen,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right: 120),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          color: cMainGreen,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.active,
                            style: tsExtraSmallText,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (loginProvider.isOwner == true) {
                        Navigator.pushNamed(
                            context, RouteClass.buysubscriptionscreen);
                      } else {
                        Navigator.pushNamed(
                            context, RouteClass.subscriptiondriverscreen);
                      }
                    },
                  ),
                  DrawerWidgetTile(
                    icon: Icons.wallet,
                    text: AppLocalizations.of(context)!.myWallet,
                    trailing: const Text(
                      '₹ 0.00',
                      style: tsRgularGreen,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.mywalletscreen);
                    },
                  ),
                  DrawerWidgetTile(
                    icon: Icons.directions_car,
                    text: "My Rides",
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.mytrips);
                    },
                  ),

                  if (isOwner != null && isOwner == true)
                    DrawerRowWidget(
                      icon: Icons.report,
                      text: AppLocalizations.of(context)!.report,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportScreen(),
                          ),
                        );
                        // Navigator.pushNamed(context, RouteClass.reportscreen);
                      },
                    ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.share,
                    text: AppLocalizations.of(context)!.inviteFriends,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReferFriendCodeScreen(),
                        ),
                      );
                    },
                  ),
                  sizedBoxHeight20,
                  // DrawerRowWidget(
                  //   icon: Icons.settings,
                  //   text: AppLocalizations.of(context)!.settings,
                  //   subtitle: AppLocalizations.of(context)!.themeLanguage,
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, RouteClass.settingsscreen);
                  //   },
                  // ),
                  // sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.settings_applications,
                    text: AppLocalizations.of(context)!.townerSettings,
                    onPressed: () {
                      provider.isOwner
                          ? Navigator.pushNamed(
                              context, RouteClass.settingsscreenowner)
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SettingsScreenDriver(),
                              ),
                            );
                    },
                    subtitle: AppLocalizations.of(context)!.townerApp,
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.attach_money,
                    text: AppLocalizations.of(context)!.profitLoss,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.profitandloss);
                    },
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.business,
                    text: AppLocalizations.of(context)!.businessAnalytics,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.businessanalyticsscreen);
                    },
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.people,
                    text: AppLocalizations.of(context)!.community,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteClass.communitymainscreen);
                    },
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.call,
                    text: AppLocalizations.of(context)!.contactUs,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.contactusscreen);
                    },
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.info,
                    text: AppLocalizations.of(context)!.fAQs,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.faqsscreen);
                    },
                  ),
                  sizedBoxHeight20,
                  DrawerRowWidget(
                    icon: Icons.gavel,
                    text: AppLocalizations.of(context)!.legal,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteClass.legalScreen);
                    },
                  ),
                  // sizedBoxHeight20,
                  // DrawerRowWidget(
                  //   icon: Icons.policy,
                  //   text: AppLocalizations.of(context)!.privacyPolicy,
                  //   onPressed: () {
                  //     Navigator.pushNamed(
                  //         context, RouteClass.privacypolicyscreen);
                  //   },
                  // ),
                  sizedBoxHeight10,
                  DrawerWidgetTile(
                    icon: Icons.logout,
                    text: AppLocalizations.of(context)!.logout,
                    onPressed: () async {
                      LocalStorageService localStorageService =
                          LocalStorageService();

                      showBackConfirmationDialog(
                        context,
                        AppLocalizations.of(context)!.logoutConfirmation,
                        AppLocalizations.of(context)!.areYouSureYouWantToLogout,
                        AppLocalizations.of(context)!.no,
                        AppLocalizations.of(context)!.yes,
                        () {
                          localStorageService.removeToken();
                          // context.read<LoginProvider>().stopBubble();
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteClass.ownerDriverSelectionScreen,
                              (route) => false);
                        },
                      );
                    },
                  ),
                  Center(
                    child: CustomTextWidget(
                        text: 'Version : 1.0.2',
                        size: 14,
                        color: cTextGrey,
                        weight: FontWeight.w300),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
