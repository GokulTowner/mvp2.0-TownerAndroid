import '../../../../imports.dart';

class AddVehicleScreen extends StatelessWidget {
  final int? flag;
  const AddVehicleScreen({this.flag, super.key});

  @override
  Widget build(BuildContext context) {
    final addVehicleProvider =
        Provider.of<AddVehicleProvider>(context, listen: false);
    final addVehicleProviderWatch = context.watch<AddVehicleProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Column(
              children: [
                CustomHeader(
                  title: AppLocalizations.of(context)!.vehicleProfiles,
                  isOption: true,
                  widgets: flag == 1 && flag != null
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
                                      InkWell(
                                        onTap: () {
                                          showDeleteConfirmationDialog(
                                            context,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(AppLocalizations.of(context)!
                                                .deleteProfile),
                                            const Icon(Icons.delete)
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: PopupMenuItem(
                                          // value: 'option1',
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(AppLocalizations.of(context)!
                                                  .edit),
                                              const Icon(Icons.edit),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          icon: const Icon(Icons.more_vert),
                        )
                      : IconButton(onPressed: () {}, icon: sizedBoxHeight0),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: pPagePadding_8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: cMainGreen,
                              ),
                              height: 7,
                            ),
                            sizedBoxHeight5,
                            Text(
                              AppLocalizations.of(context)!.stepOne,
                              style: tsRegularTextBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: pPagePadding_8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: addVehicleProvider.isStepTwo == true
                                    ? cMainGreen
                                    : Colors.grey,
                              ),
                              height: 7,
                            ),
                            sizedBoxHeight5,
                            Text(
                              AppLocalizations.of(context)!.stepTwo,
                              style: tsRegularTextBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                addVehicleProvider.isStepTwo == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            textEditingController: addVehicleProvider.vehicleNo,
                            isPass: false,
                            hint: AppLocalizations.of(context)!
                                .vehicleRegistrationNumber,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!.vehicleType,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint: AppLocalizations.of(context)!.vehicleType,
                            itemType: 'vehicleType',
                            selectedValue:
                                addVehicleProviderWatch.selectedVehicleType,
                            dataList: addVehicleProvider.vehicleTypeList,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .vehicleSeatingCapacity,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint: AppLocalizations.of(context)!
                                .vehicleSeatingCapacity,
                            dataList: addVehicleProvider.seatingCapacityList,
                            itemType: 'seatingCapacity',
                            selectedValue:
                                addVehicleProviderWatch.selectedSeatingCapacity,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!.vehicleColour,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint: AppLocalizations.of(context)!.vehicleColour,
                            dataList: addVehicleProvider.vehicleColorList,
                            itemType: 'vehicleColor',
                            selectedValue:
                                addVehicleProviderWatch.selectedVehicleColor,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              textEditingController:
                                  addVehicleProvider.vehicleModel,
                              isPass: false,
                              hint: AppLocalizations.of(context)!
                                  .vehicleMakersModelExHondaCity),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            textEditingController:
                                addVehicleProvider.vehicleManYear,
                            isPass: false,
                            hint: AppLocalizations.of(context)!
                                .vehicleYearManufacturing,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  addVehicleProvider
                                      .showDatePickerDriver(context);
                                },
                                icon:
                                    const Icon(Icons.calendar_month_outlined)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!.selectServiceType,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint:
                                AppLocalizations.of(context)!.selectServiceType,
                            dataList: addVehicleProvider.serviceTypeList,
                            itemType: 'serviceP',
                            selectedValue:
                                addVehicleProviderWatch.selecctedServiceType,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!.selectFuelType,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint: AppLocalizations.of(context)!.selectFuelType,
                            dataList: addVehicleProvider.fuelTypeList,
                            itemType: 'fuelType',
                            selectedValue:
                                addVehicleProviderWatch.selectedFuelType,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .selectVehicleCategory,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdownWidget(
                            hint: AppLocalizations.of(context)!
                                .selectVehicleCategory,
                            dataList: addVehicleProvider.vehicleCategoryList,
                            itemType: 'vehicleCategory',
                            selectedValue:
                                addVehicleProviderWatch.selectedVehicleCategory,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onTap: () {
                              addVehicleProvider.setStepTwo();
                            },
                            title: AppLocalizations.of(context)!.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehiclephotosscreen);
                              },
                              title: AppLocalizations.of(context)!
                                  .vehiclePhotoAllSides),
                          const SizedBox(
                            height: 20,
                          ),
                          // const VehicleRcShowContainerWidget(),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehiclercscreen);
                              },
                              title: AppLocalizations.of(context)!.uploadRC),
                          const SizedBox(
                            height: 20,
                          ),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehicleinsurancescreen);
                              },
                              title: AppLocalizations.of(context)!
                                  .vehicleInsurance),
                          const SizedBox(
                            height: 20,
                          ),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehiclepermitscreen);
                              },
                              title:
                                  AppLocalizations.of(context)!.vehiclePermit),
                          const SizedBox(
                            height: 20,
                          ),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehicleroadtaxscreen);
                              },
                              title: AppLocalizations.of(context)!
                                  .vehicleTaxReciept),
                          const SizedBox(
                            height: 20,
                          ),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehicleemissionscreen);
                              },
                              title: AppLocalizations.of(context)!
                                  .vehicleEmissionCertificate),
                          const SizedBox(
                            height: 20,
                          ),
                          AppUploadDataCustomButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteClass.vehiclefitnessscreen);
                              },
                              title: AppLocalizations.of(context)!
                                  .vehicleFitnessCertificate),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onTap: () {
                                addVehicleProvider.setStepTwo();
                              },
                              title: AppLocalizations.of(context)!.back),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onTap: () {
                                VehicleProfileCreateSuccessPopup
                                    vehicleProfileCreateSuccessPopup =
                                    VehicleProfileCreateSuccessPopup();
                                vehicleProfileCreateSuccessPopup
                                    .showMessage(context);
                              },
                              title: AppLocalizations.of(context)!.saveSubmit)
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
