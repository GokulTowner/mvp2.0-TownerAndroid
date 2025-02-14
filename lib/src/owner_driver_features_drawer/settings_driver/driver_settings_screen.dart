import '../../../imports.dart';

class SettingsScreenDriver extends StatelessWidget {
  const SettingsScreenDriver({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    DriverSettingsProvider();
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
        backgroundColor: cWhiteColor,
        elevation: 0,
        title: CustomTextWidget(
            text: AppLocalizations.of(context)!.settings,
            size: 18,
            color: cDarkBlack,
            weight: FontWeight.bold),
      ),
      body: Consumer<DriverSettingsProvider>(
        builder: (context, provider, child) {
          DriverSettingModel driverSettingData = provider.driverSettingModel;
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
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.govermentRate,
                  switchValue: driverSettingData.governmentRateStatus.status,
                ),

                Padding(
                  padding: pPaddingHorizontal_45,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${AppLocalizations.of(context)!.baseFare}     :'),
                          Text(
                              driverSettingData.governmentRateStatus.baseFare ??
                                  'N/A'),
                        ],
                      ),
                      sizedBoxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${AppLocalizations.of(context)!.extraKM}       :'),
                          Text(
                              '₹${driverSettingData.governmentRateStatus.extraKm}'),
                        ],
                      ),
                      sizedBoxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${AppLocalizations.of(context)!.extraTime}    :'),
                          Text(
                              '₹${driverSettingData.governmentRateStatus.extraTime}')
                        ],
                      ),
                    ],
                  ),
                ),

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.myDiscount,
                  switchValue: driverSettingData.myDiscountStatus.status,
                ),
                sizedBoxHeight10,
                driverSettingData.myDiscountStatus.status
                    ? DriverRadioButtonWidget(
                        amount: provider.myDiscAmount,
                        percentage: provider.myDiscPercentage,
                        readOnlyAmt: true,
                        readOnlyPerc: true,
                      )
                    : sizedBoxHeight0,
                //************************************************************* */
                sizedBoxHeight10,
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.convenienceCharge,
                  switchValue: driverSettingData.convenienceCharge.status,
                ),

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.nightFare,
                  switchValue: driverSettingData.nightFare.status,
                ),

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.walletActive,
                  switchValue: driverSettingData.walletActive.status,
                ),

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.subscriptions,
                  subTitle: 'Auto',
                  switchValue: driverSettingData.subscription.status,
                ),
                //************************************************************* */

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.inviteFriends,
                  function: (value) {
                    provider.setInvitDriverStatus(value);
                  },
                  switchValue: driverSettingData.inviteDrivers.status,
                ),

                //************************************************************* */
                DriverSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.referralBonus,
                  function: (value) {
                    provider.setReferralBonusStatus(value);
                  },
                  switchValue: driverSettingData.referralBonus.status,
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
