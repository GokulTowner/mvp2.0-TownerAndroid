import 'package:townerapp/models/driver_info_modal.dart';
import 'package:townerapp/src/owner_speed_dial/driver_manager/add_driver/model/driver_docs_modal.dart';

import '../../../../imports.dart';

class AddDriverScreen extends StatelessWidget {
  final bool? isDriverProfile;
  final bool? isOwner;
  final int? flag;
  final DriverProfileModel? driverProfile;
  const AddDriverScreen(
      {this.driverProfile,
      this.isDriverProfile,
      this.isOwner,
      this.flag,
      super.key});

  @override
  Widget build(BuildContext context) {
    DriverProfileProvider();
    late AddDriverProvider addDriverProviderPass;
    final loginProvider = context.read<LoginProvider>();
    addDriverProviderPass = Provider.of<AddDriverProvider>(context, listen: false);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: SingleChildScrollView(
            child: Consumer<AddDriverProvider>(
              builder: (context, addDriverProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                      title: isDriverProfile != null ||
                              loginProvider.isOwner == false
                          ? AppLocalizations.of(context)!.editDriverProfile
                          : AppLocalizations.of(context)!.addDriverProfile,
                      isOption: isDriverProfile == true ||
                              loginProvider.isOwner == false
                          ? true
                          : false,
                      widgets: isDriverProfile != null ||
                              loginProvider.isOwner == false
                          ? IconButton(
                              onPressed: () {
                                showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(
                                      MediaQuery.of(context).size.width,
                                      kToolbarHeight,
                                      0.0,
                                      0.0),
                                  items: [
                                    PopupMenuItem(
                                      child: Column(
                                        children: [
                                          sizedBoxHeight10,
                                          if (context
                                                  .read<LoginProvider>()
                                                  .isOwner ==
                                              true)
                                            InkWell(
                                              onTap: () {
                                                showDeleteConfirmationDialog(
                                                  context,
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(AppLocalizations.of(
                                                          context)!
                                                      .removeDriver),
                                                  sizedBoxWidth20,
                                                  const Icon(Icons.delete)
                                                ],
                                              ),
                                            ),
                                          sizedBoxHeight10,
                                          InkWell(
                                            onTap: () {
                                              addDriverProvider
                                                  .setIsReadOnly(false);
                                              Navigator.pop(context);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .edit),
                                                sizedBoxWidth20,
                                                const Icon(Icons.edit),
                                              ],
                                            ),
                                          ),
                                          sizedBoxHeight10,
                                          if (context
                                                  .read<LoginProvider>()
                                                  .isOwner ==
                                              true)
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context,
                                                    RouteClass
                                                        .createNewPasswordScreen);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(AppLocalizations.of(
                                                          context)!
                                                      .resetPassword),
                                                  sizedBoxWidth20,
                                                  const Icon(Icons.refresh),
                                                ],
                                              ),
                                            ),
                                          sizedBoxHeight10
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              icon: const Icon(Icons.more_vert),
                            )
                          : sizedBoxHeight0,
                    ),
                    sizedBoxHeight20,
                    CustomTextFormField(
                        readOnly: addDriverProvider.isReadOnly,
                        textEditingController: addDriverProvider.driverName,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.drivername),
                    sizedBoxHeight20,
                    CustomTextFormField(
                        readOnly: addDriverProvider.isReadOnly,
                        textEditingController:
                            addDriverProvider.driverPhoneNumber,
                        isPass: false,
                        hint: AppLocalizations.of(context)!.driverPhoneNumber),
                    sizedBoxHeight20,
                    loginProvider.isOwner && isDriverProfile == null
                        ? CustomTextFormField(
                            suffixIcon: IconButton(
                              onPressed: () {
                                addDriverProvider.setShowPass();
                              },
                              icon: Icon(
                                addDriverProvider.showPass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xFFA8A8A8),
                              ),
                            ),
                            textEditingController:
                                addDriverProvider.driverPassword,
                            isPass: addDriverProvider.showPass,
                            hint: AppLocalizations.of(context)!
                                .enterDriverPassword)
                        : sizedBoxHeight20,
                    isDriverProfile != null && addDriverProvider.isReadOnly
                        ? Center(
                            child: Image.network(driverProfile!.driverPhoto))
                        : loginProvider.isOwner == false &&
                                addDriverProvider.isReadOnly
                            ? Center(
                                child: Image.network("https://www.cgg.gov.in/wp-content/uploads/2017/10/dummy-profile-pic-male1.jpg",),
                              )
                            : Center(
                                child: Container(
                                  height: height * 0.23,
                                  width: width * 0.9,
                                  decoration: const BoxDecoration(
                                    border: BorderDirectional(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: addDriverProvider.image == null
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.image,
                                            size: 100,
                                          ),
                                          onPressed: () async {
                                            // this is bottom sheet that allready added in the common widget
                                            // Here we can sent the context as well as the provider also
                                            // and the provider should initialise as late then assing to that
                                            // which provider you want to use.
                                            bottomSheet(
                                                context: context,
                                                provider:
                                                    addDriverProviderPass);
                                          },
                                        )
                                      : Stack(
                                          children: [
                                            Positioned(
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    bottomSheet(
                                                        context: context,
                                                        provider:
                                                            addDriverProviderPass);
                                                  },
                                                  child: SizedBox(
                                                    height: 250,
                                                    width: 210,
                                                    child: Image.file(
                                                      addDriverProvider.image!,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                    loginProvider.isOwner == false &&
                            !addDriverProvider.isReadOnly
                        ? Center(
                            child: Text(
                              AppLocalizations.of(context)!.addDriverPhoto,
                              style: TextStyle(
                                  color: cTextDarkGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : sizedBoxHeight20,
                    AppUploadDataCustomButton(
                      onTap: () {
                        final provider = context.read<DriverLicenseProvider>();
                        if (driverProfile != null) {
                          provider.getDriverDetailsForViewAndEditOwner(
                              driverProfile!);
                          provider.setIsReadOnly(true);
                        } else if (!loginProvider.isOwner) {
                          DriverDocument? driverDetails = context.read<AddDriverProvider>().driverDetails!.document?.singleWhere(((e)=>e.slug=="drivingLicense"));
                          provider.getDriverDetailsForViewAndEditDriver(
                              driverDetails);
                          provider.setIsReadOnly(true);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverLicenseScreen(
                              driverProfile: driverProfile,
                              driverDetails: context
                                  .read<AddDriverProvider>()
                                  .driverDetails!
                                  .document
                                  ?.singleWhere(
                                      ((e) => e.slug == "drivingLicense")),
                              isDriverProfile: isDriverProfile,
                            ),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.uploadDrivingLicence,
                    ),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                        onTap: () {
                          final provider = context.read<DriverAadharCardProvider>();
                          if (driverProfile != null) {
                            provider.getDriverDetailsForViewAndEditOwner(
                                driverProfile!);
                            provider.setIsReadOnly(true);
                          } else if (!loginProvider.isOwner) {
                            DriverDocument driverDetails = context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="aadharCard"));
                            provider.getDriverDetailsForViewAndEditDriver(
                                driverDetails!);
                            provider.setIsReadOnly(true);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverAadharScreen(
                                driverProfile: driverProfile,
                                driverDetails: context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="aadharCard")),
                                isDriverProfile: isDriverProfile,
                              ),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.aadhar),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                      onTap: () {
                        final provider = context.read<DriverPancardProvider>();
                        if (driverProfile != null) {
                          provider.getDriverDetailsForViewAndEditOwner(
                              driverProfile!);
                          provider.setIsReadOnly(true);
                        } else if (!loginProvider.isOwner) {
                          DriverDocument driverDetails = context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="panCard"));
                          provider.getDriverDetailsForViewAndEditDriver(driverDetails);
                          provider.setIsReadOnly(true);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverPancardScreen(
                              driverProfile: driverProfile,
                              driverDetails: context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="panCard")),
                              isDriverProfile: isDriverProfile,
                            ),
                          ),
                        );
                      },
                      title: AppLocalizations.of(context)!.panCard,
                    ),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                        onTap: () {
                          final provider =
                              context.read<DriverVoterIdProvider>();
                          if (driverProfile != null) {
                            provider.getDriverDetailsForViewAndEditOwner(
                                driverProfile!);
                            provider.setIsReadOnly(true);
                          } else if (!loginProvider.isOwner) {
                            DriverDocument driverDetails = context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="voterId"));
                            provider.getDriverDetailsForViewAndEditDriver(
                                addDriverProvider.driverDummyDetails!);
                            provider.setIsReadOnly(true);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverVoterIdScreen(
                                  isDriverProfile: isDriverProfile,
                                  driverDetails:
                                      addDriverProvider.driverDummyDetails,
                                  driverProfile: driverProfile),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.votersID),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                        onTap: () {
                          final provider =
                              context.read<DriverDisplayCardProvider>();
                          if (driverProfile != null) {
                            provider.getDriverDetailsForViewAndEditOwner(
                                driverProfile!);
                            provider.setIsReadOnly(true);
                          } else if (!loginProvider.isOwner) {
                            // DriverDocument driverDetails = context.read<AddDriverProvider>().driverDetails!.document!.singleWhere(((e)=>e.slug=="displayCard"));
                            provider.getDriverDetailsForViewAndEditDriver(addDriverProvider.driverDummyDetails!);
                            provider.setIsReadOnly(true);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverDisplayCardScreen(
                                driverProfile: driverProfile,
                                driverDetails: addDriverProvider.driverDummyDetails,
                                isDriverProfile: isDriverProfile,
                              ),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.driverDisplayCard),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                        onTap: () {
                          final provider =
                              context.read<DriverPolicVarProvider>();
                          if (driverProfile != null) {
                            provider.getDriverDetailsForViewAndEditOwner(
                                driverProfile!);
                            provider.setIsReadOnly(true);
                          } else if (!loginProvider.isOwner) {
                            // DriverDocument? driverDetails = context.read<AddDriverProvider>().driverDetails!.document!.singleOrNull!;
                            provider.getDriverDetailsForViewAndEditDriver(
                                addDriverProvider.driverDummyDetails!);
                            provider.setIsReadOnly(true);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverPoliceVarScreen(
                                driverProfile: driverProfile,
                                driverDetails: addDriverProvider.driverDummyDetails,
                                isDriverProfile: isDriverProfile,
                              ),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!
                            .driverPoliceVerification),
                    sizedBoxHeight20,
                    AppUploadDataCustomButton(
                        onTap: () {
                          final provider =
                              context.read<DriverUniqueIdProvider>();
                          if (driverProfile != null) {
                            provider.getDriverDetailsForViewAndEditOwner(
                                driverProfile!);
                            provider.setIsReadOnly(true);
                          } else if (!loginProvider.isOwner) {
                            provider.getDriverDetailsForViewAndEditDriver(
                                addDriverProvider.driverDummyDetails!);
                            provider.setIsReadOnly(true);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverUniqueIdScreen(
                                driverProfile: driverProfile,
                                driverDetails: addDriverProvider.driverDummyDetails,
                                isDriverProfile: isDriverProfile,
                              ),
                            ),
                          );
                        },
                        title: AppLocalizations.of(context)!.uniqueDriverID),
                    sizedBoxHeight20,
                    CustomButton(
                      onTap: () {
                       addDriverProvider.saveData(context);
                      },
                      title: AppLocalizations.of(context)!.saveSubmit,
                    ),
                    sizedBoxHeight20,
                    sizedBoxHeight20,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
