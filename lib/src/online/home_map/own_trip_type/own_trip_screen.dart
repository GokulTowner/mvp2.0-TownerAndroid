import '../../../../imports.dart';

class OwnTripServiceTypeScreen extends StatefulWidget {
  final int flag;
  const OwnTripServiceTypeScreen({required this.flag, super.key});

  @override
  State<OwnTripServiceTypeScreen> createState() =>
      _OwnTripServiceTypeScreenState();
}

class _OwnTripServiceTypeScreenState extends State<OwnTripServiceTypeScreen> {
  @override
  void initState() {
    OwnTripServiceTypeProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Consumer<OwnTripServiceTypeProvider>(
              builder: (BuildContext context, provider, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                        title: AppLocalizations.of(context)!.createOwnTrip),
                    sizedBoxHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.tripType,
                          style: tsMediumText,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: cDarkBlack,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.flag == 1
                                            ? AppLocalizations.of(context)!
                                                .dailyRide
                                            : widget.flag == 2
                                                ? AppLocalizations.of(context)!
                                                    .rental
                                                : AppLocalizations.of(context)!
                                                    .outstation,
                                        style: TextStyle(
                                            fontSize: 20.0, color: cMainGreen),
                                      ),
                                      Icon(Icons.check_circle,
                                          color: cMainGreen),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight10,
                    Consumer<OwnTripServiceTypeProvider>(
                      builder: (context, provider, child) {
                        return SizedBox(
                          height: 200,
                          child: provider.currentPosition != null
                              ? GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        provider.currentPosition!.latitude,
                                        provider.currentPosition!.longitude),
                                    zoom: 14.0,
                                  ),
                                  onMapCreated: (controller) {
                                    provider.initMapController(controller);
                                    provider.moveCameraToPosition(
                                        provider.currentPosition!);
                                  },
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  markers: provider.markers,
                                  polylines: provider.polylines,
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        );
                      },
                    ),
                    sizedBoxHeight15,
                    Text(
                      AppLocalizations.of(context)!.pickupLocation,
                      style: tsRegularText,
                    ),
                    sizedBoxHeight10,
                    CustomTextFormField(
                      validator: (value) {
                        return provider.currentLocationValidation(
                            value, context);
                      },
                      textEditingController: provider.currentLocationController,
                      isPass: false,
                      hint: 'JP Nagar',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.location_on_outlined),
                        onPressed: () {},
                      ),
                      onChanged: (query) {
                        provider.updateCurrentLocationField(true);
                        provider.getSuggestions(query);
                      },
                    ),
                    sizedBoxHeight20,
                    Text(
                      AppLocalizations.of(context)!.dropLocation,
                      style: tsRegularText,
                    ),
                    sizedBoxHeight10,
                    CustomTextFormField(
                      textEditingController: provider.destinationController,
                      isPass: false,
                      hint: 'Jaya Nagar',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.location_on_outlined),
                        onPressed: () {},
                      ),
                      onChanged: (query) {
                        provider.updateCurrentLocationField(false);
                        provider.getSuggestions(query);
                      },
                      validator: (value) {
                        return provider.destinationValidation(value, context);
                      },
                    ),
                    Consumer<OwnTripServiceTypeProvider>(
                      builder: (context, provider, child) {
                        final suggestions = provider.isCurrentLocationField
                            ? provider.currentLocationSuggestions
                            : provider.destinationSuggestions;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: suggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion = suggestions[index];
                            return ListTile(
                              title: Text(suggestion['description']),
                              onTap: () {
                                provider.searchLocation(suggestion['place_id'],
                                    suggestion['description']);
                              },
                            );
                          },
                        );
                      },
                    ),
                    sizedBoxHeight10,
                    Consumer<OwnTripServiceTypeProvider>(
                      builder: (context, provider, child) {
                        if (provider.distanceText != null &&
                            provider.durationText != null) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Distance: ${provider.distanceText}  -  Duration: ${provider.durationText}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxHeight20,
                        Text(AppLocalizations.of(context)!.customerInformation,
                            style: tsRegularTextBold),
                        sizedBoxHeight25,
                        Text(
                          AppLocalizations.of(context)!.customerName,
                          style: tsRegularText,
                        ),
                        sizedBoxHeight10,
                        CustomTextFormField(
                          textEditingController: provider.nameController,
                          isPass: false,
                          hint: 'Narayana Iyer',
                        ),
                        sizedBoxHeight5,
                        Row(
                          children: [
                            Checkbox(
                              activeColor: cDarkBlack,
                              checkColor: cWhiteColor,
                              value: provider.isChecked,
                              onChanged: (value) {
                                provider.toggleCheckbox();
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!.noMobileCustome,
                              style: tsSmallText,
                            ),
                          ],
                        ),
                        sizedBoxHeight5,
                        provider.isChecked
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.mobileNumber,
                                    style: tsRegularText,
                                  ),
                                  sizedBoxHeight10,
                                  CustomTextFormField(
                                    textEditingController:
                                        provider.mobileController,
                                    isPass: false,
                                    hint: '- 7683926523',
                                    prefixIcon: SizedBox(
                                      width: 50,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          const Text(
                                            '+91',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xFFA8A8A8),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            color: cWhiteColor,
                                            height: 30,
                                            width: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    suffixIcon: null,
                                  ),
                                  sizedBoxHeight10,
                                ],
                              ),
                        Text(
                          AppLocalizations.of(context)!.applyCoupon,
                          style: tsRegularText,
                        ),
                        sizedBoxHeight10,
                        CustomTextFormField(
                          textEditingController: provider.couponController,
                          isPass: false,
                          hint: 'ABC12345000',
                        ),
                        sizedBoxHeight30,
                      ],
                    ),
                    widget.flag == 3
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.tripDetails,
                                style: tsRegularTextBold,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: '1',
                                        groupValue: provider.groupValue,
                                        activeColor: cDarkBlack,
                                        onChanged: (value) {
                                          provider.setGroupValue(value!);
                                        },
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.roundTrip,
                                        style: tsRegularText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: '2',
                                        groupValue: provider.groupValue,
                                        activeColor: cDarkBlack,
                                        onChanged: (value) {
                                          provider.setGroupValue(value!);
                                        },
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.oneWay,
                                        style: tsRegularText,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                              sizedBoxHeight20,
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .tripStartDate,
                                          style: tsRegularText,
                                        ),
                                        sizedBoxHeight5,
                                        CustomTextFormField(
                                          textEditingController:
                                              provider.startDateController,
                                          isPass: false,
                                          hint: '28 Nov 22',
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              provider.selectDate(
                                                  context, true);
                                            },
                                            icon: const Icon(
                                                Icons.calendar_month_outlined),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .tripEndDate,
                                          style: tsRegularText,
                                        ),
                                        sizedBoxHeight5,
                                        CustomTextFormField(
                                          textEditingController:
                                              provider.endDateController,
                                          isPass: false,
                                          hint: '02 Dec 22',
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              provider.selectDate(
                                                  context, false);
                                            },
                                            icon: const Icon(
                                                Icons.calendar_month_outlined),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizedBoxHeight20,
                                ],
                              ),
                              sizedBoxHeight20,
                            ],
                          )
                        : const SizedBox(),
                    widget.flag == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .selectTheRentalScheme,
                                style: tsRegularTextBold,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: '1',
                                    groupValue: provider.groupValue,
                                    activeColor: cDarkBlack,
                                    onChanged: (value) {
                                      provider.setGroupValue(value!);
                                    },
                                  ),
                                  const Text(
                                    '1 Day Rental',
                                    style: tsRegularText,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '1hrs/20 km',
                                    style: tsRegularText,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: '2',
                                    groupValue: provider.groupValue,
                                    activeColor: cDarkBlack,
                                    onChanged: (value) {
                                      provider.setGroupValue(value!);
                                    },
                                  ),
                                  const Text(
                                    'Weekly',
                                    style: tsRegularText,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '4hrs/40 km',
                                    style: tsRegularText,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: '3',
                                    activeColor: cDarkBlack,
                                    groupValue: provider.groupValue,
                                    onChanged: (value) {
                                      provider.setGroupValue(value!);
                                    },
                                  ),
                                  const Text(
                                    'Monthly',
                                    style: tsRegularText,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '6hrs/60 km',
                                    style: tsRegularText,
                                  ),
                                ],
                              ),
                              sizedBoxHeight20,
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFa8a8a8),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 60),
                              child: Center(
                                child: Text(
                                    AppLocalizations.of(context)!.cancel,
                                    style: tsRegularTextBold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EstimationRideContainer(
                                    tripType: AppLocalizations.of(context)!
                                        .dailyRide);
                              },
                            ).then(
                              (value) {
                                if (value == true) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const OTPWaiting();
                                    },
                                  );
                                }
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: cMainGreen,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.getEstimate,
                                  style: tsRegularTextBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight35,
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
