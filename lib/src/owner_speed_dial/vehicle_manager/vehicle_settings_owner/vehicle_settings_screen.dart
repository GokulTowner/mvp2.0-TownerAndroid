import '../../../../imports.dart';

class VehicleSettingsScreenOwner extends StatelessWidget {
  final String vehId;

  const VehicleSettingsScreenOwner({required this.vehId, super.key});

  @override
  Widget build(BuildContext context) {
    VehicleSettingsProvider();
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
      body: Consumer<VehicleSettingsProvider>(
        builder: (context, provider, child) {
          VehicleSettingsModel vehicleSettingsModel =
              provider.vehicleSettingsModel;
          return SingleChildScrollView(
            child: Column(
              children: [
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.govermentRate,
                  switchValue: vehicleSettingsModel.governmentRateStatus.status,
                ),
                vehicleSettingsModel.governmentRateStatus.status
                    ? Padding(
                        padding: pPaddingHorizontal_45,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.baseFare}     :'),
                                const Text('4*100 = 100'),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.extraKM}       :'),
                                const Text('₹21 for 1 KM'),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.extraTime}    :'),
                                const Text('₹1 for 1 min')
                              ],
                            ),
                          ],
                        ),
                      )
                    : sizedBoxHeight0,

                //************************************************************* */
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.myDiscount,
                  function: (value) {
                    provider.setMyDiscountStatus(value);
                  },
                  switchValue: vehicleSettingsModel.myDiscountStatus.status,
                ),
                vehicleSettingsModel.myDiscountStatus.status
                    ? VehicleRadioButtonWidget(
                        amount: provider.myDiscAmount,
                        percentage: provider.myDiscPercentage,
                        readOnlyAmt: false,
                        readOnlyPerc: false,
                      )
                    : sizedBoxHeight0,
                //************************************************************* */
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.convenienceCharge,
                  function: (value) {
                    provider.setConvenienceChargeStatus(value);
                  },
                  switchValue: vehicleSettingsModel.convenienceCharge.status,
                ),

                //************************************************************* */
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.nightFare,
                  function: (value) {
                    provider.setNightFareStatus(value);
                  },
                  switchValue: vehicleSettingsModel.nightFare.status,
                ),

                //************************************************************* */
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.walletActive,
                  function: (value) {
                    provider.setWalletActiveStatus(value);
                  },
                  switchValue: vehicleSettingsModel.walletActive.status,
                ),

                //************************************************************* */
                VehicleSwitchButtonWidget(
                  title: AppLocalizations.of(context)!.subscriptions,
                  subTitle: AppLocalizations.of(context)!.auto,
                  function: (value) {
                    provider.setSubscriptionsStatus(value);
                  },
                  switchValue: vehicleSettingsModel.subscription.status,
                ),
                //************************************************************* */
                sizedBoxHeight20,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: CustomTextButton(
                      text: AppLocalizations.of(context)!.saveTheChanges,
                      color: cMainGreen,
                      callBack: () {
                        provider.updateVehicleSetting();
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
