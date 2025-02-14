import '../../../imports.dart';

class SettingsScreenOwner extends StatelessWidget {
  const SettingsScreenOwner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    OwnerSettingsProvider();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Image(
            image: AssetImage(imgBackArrow),
          ),
        ),
        iconTheme: IconThemeData(
          color: cDarkBlack,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: CustomTextWidget(
            text: AppLocalizations.of(context)!.settings,
            size: 18,
            color: cDarkBlack,
            weight: FontWeight.bold),
      ),
      body: Consumer<OwnerSettingsProvider>(
        builder: (context, provider, child) {
          OwnerSettingModel ownerSettingData = provider.ownerSettingModel;
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: pPagePadding_20,
                  child: Consumer<SystemSettingsController>(
                    builder: (context, systemSettingsProvider, child) {
                      return Column(
                        children: [
                          Container(
                            height: height * 0.075,
                            width: width * 0.94,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: DropdownButton<ThemeMode>(
                                  elevation: 6,
                                  isExpanded: true,
                                  value: systemSettingsProvider.themeMode,
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: const Color(0xFFEEEEEE),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (value) {
                                    if (value == null) return;
                                    systemSettingsProvider
                                        .updateThemeMode(value);
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: ThemeMode.system,
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .systemTheme,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFFA8A8A8),
                                          )),
                                    ),
                                    DropdownMenuItem(
                                      value: ThemeMode.light,
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .lightTheme,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFFA8A8A8),
                                          )),
                                    ),
                                    DropdownMenuItem(
                                      value: ThemeMode.dark,
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .darkTheme,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFFA8A8A8),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            height: height * 0.075,
                            width: width * 0.94,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: DropdownButton<Locale>(
                                  isExpanded: true,
                                  value: systemSettingsProvider.language,
                                  onChanged: (value) {
                                    systemSettingsProvider
                                        .updateLanguage(value);
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  dropdownColor: const Color(0xFFEEEEEE),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: const Locale('en'),
                                      child: Text(
                                        AppLocalizations.of(context)!.english,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFFA8A8A8),
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: const Locale('te'),
                                      child: Text(
                                          AppLocalizations.of(context)!.telugu,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFFA8A8A8),
                                          )),
                                    ),
                                    DropdownMenuItem(
                                      value: const Locale('kn'),
                                      child: Text(
                                        AppLocalizations.of(context)!.kannada,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFFA8A8A8),
                                        ),
                                      ),
                                    ),
                                    // DropdownMenuItem(
                                    //   value: Locale('hi'),
                                    //   child: Text(
                                    //     'Hindi',
                                    //     style: TextStyle(
                                    //       fontSize: 17,
                                    //       color: Color(0xFFA8A8A8),
                                    //     ),
                                    //   ),
                                    // ),
                                    DropdownMenuItem(
                                      value: const Locale('mr'),
                                      child: Text(
                                        AppLocalizations.of(context)!.marathi,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFFA8A8A8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.govermentRate,
                  switchValue: ownerSettingData.govRate.status,
                ),

                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.promotionalDiscount,
                  function: (value) {
                    provider.setPromotionalDiscountStatus(value);
                  },
                  switchValue: ownerSettingData.promotionalDiscount.status,
                ),

                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.gst,
                  function: (value) {
                    provider.setGstStatus(value);
                  },
                  switchValue: ownerSettingData.gst.status,
                ),
                sizedBoxHeight10,
                ownerSettingData.gst.status
                    ? PercentageWidget(
                        percentage: provider.gstPercentage,
                        readOnlyPerc: provider.gstReadOnly,
                      )
                    : sizedBoxHeight0,

                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.onlineBooking,
                  function: (value) {
                    provider.onlineAndLeadBookingStatus(value);
                  },
                  switchValue: ownerSettingData.onlineBooking.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.leadCharge,
                  function: (value) {
                    provider.onlineAndLeadBookingStatus(value);
                  },
                  switchValue: ownerSettingData.leadCharge.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.selfBooking,
                  function: (value) {
                    provider.setSelfBookingStatus(value);
                  },
                  switchValue: ownerSettingData.selfBooking.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.billsShare,
                  function: (value) {
                    provider.setBillShareStatus(value);
                  },
                  switchValue: ownerSettingData.billShare.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.itrFiling,
                  function: (value) {
                    provider.setItrFilingStatus(value);
                  },
                  switchValue: ownerSettingData.itrFiling.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.gstRegFiling,
                  function: (value) {
                    provider.setGstRegFilingStatus(value);
                  },
                  switchValue: ownerSettingData.gstRegFiling.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.pAndLFiling,
                  function: (value) {
                    provider.setPlFillingStatus(value);
                  },
                  switchValue: ownerSettingData.plFilling.status,
                ),

                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.inviteCustomers,
                  function: (value) {
                    provider.setInviteCustomersStatus(value);
                  },
                  switchValue: ownerSettingData.inviteCustomers.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.tripsHistory,
                  function: (value) {
                    provider.setTripsHistoryStatus(value);
                  },
                  switchValue: ownerSettingData.tripsHistory.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.inviteDrivers,
                  function: (value) {
                    provider.setInviteDriversStatus(value);
                  },
                  switchValue: ownerSettingData.inviteDrivers.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.walletActive,
                  function: (value) {
                    provider.setWalletActiveStatus(value);
                  },
                  switchValue: ownerSettingData.walletActive.status,
                ),
                //************************************************************* */
                SwitchButtonWidget(
                  title: AppLocalizations.of(context)!.referralBonus,
                  function: (value) {
                    provider.setReferralBonusStatus(value);
                  },
                  switchValue: ownerSettingData.referralBonus.status,
                ),

                //************************************************************* */
                sizedBoxHeight20,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: CustomTextButton(
                      text: AppLocalizations.of(context)!.saveTheChanges,
                      color: cMainGreen,
                      callBack: () {
                        provider.updateOwnerSetting();
                      },
                      textColor: cDarkBlack,
                      border: 0.0,
                      fontSize: 16.0,
                      borderColor: cWhiteColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
