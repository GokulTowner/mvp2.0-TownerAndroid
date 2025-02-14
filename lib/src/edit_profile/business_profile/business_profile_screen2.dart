import '../../../imports.dart';

class BusinessStep2 extends StatefulWidget {
  const BusinessStep2({super.key});

  @override
  State<BusinessStep2> createState() => _BusinessStep1State();
}

class _BusinessStep1State extends State<BusinessStep2> {
  final TextEditingController _ownerMobile = TextEditingController();
  // final TextEditingController _gstNumber = TextEditingController();
  // final TextEditingController _panNumber = TextEditingController();
  // final TextEditingController _ownerAadhar = TextEditingController();
  final TextEditingController _referralCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final vehicleInsuranceProvider =
    //     Provider.of<VehicleInsuranceProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: 'Business Profile'),
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
                              'Personal Details',
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
                                color: cMainGreen,
                              ),
                              height: 7,
                            ),
                            sizedBoxHeight5,
                            Text(
                              'RC Owner',
                              style: tsRegularTextBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight30,
                CustomTextFormField(
                    textEditingController: _ownerMobile,
                    isPass: false,
                    hint: '',
                    prefixIcon: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          sizedBoxHeight10,
                          const Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFA8A8A8),
                            ),
                          ),
                          sizedBoxHeight5,
                          Container(
                            color: cWhiteColor,
                            height: 30,
                            width: 1,
                          )
                        ],
                      ),
                    ),
                    suffixIcon: null),
                sizedBoxHeight30,
                CustomTextButton(
                  text: 'Gst Number',
                  color: cLightGrey,
                  callBack: () {
                    Navigator.pushNamed(
                        context, RouteClass.ownerrcnumberscreen);
                  },
                  textColor: cTextGrey,
                  border: 5,
                  fontSize: 15,
                  borderColor: cLightGrey,
                ),
                sizedBoxHeight30,
                CustomTextButton(
                  text: 'Pan Number',
                  color: cLightGrey,
                  callBack: () {
                    Navigator.pushNamed(context, RouteClass.ownerpancardscreen);
                  },
                  textColor: cTextGrey,
                  border: 5,
                  fontSize: 16,
                  borderColor: cLightGrey,
                ),
                sizedBoxHeight30,
                CustomTextButton(
                  text: 'Owner Adhar',
                  color: cLightGrey,
                  callBack: () {
                    Navigator.pushNamed(context, RouteClass.owneradharscreen);
                  },
                  textColor: cTextGrey,
                  border: 5,
                  fontSize: 16,
                  borderColor: cLightGrey,
                ),
                sizedBoxHeight30,
                CustomTextFormField(
                  textEditingController: _referralCode,
                  isPass: false,
                  hint: 'Referral code',
                ),
                sizedBoxHeight50,
                const YesNoButton(text: 'Owner Cum Driver'),
                sizedBoxHeight10,
                const YesNoButton(text: 'Leased Vehicle'),
                sizedBoxHeight10,
                const YesNoButton(text: 'Digital travel agency owner'),
                sizedBoxHeight10,
                const YesNoButton(text: 'Distributor'),
                sizedBoxHeight10,
                const YesNoButton(text: 'Agreed SaaS contract Agreement'),
                sizedBoxHeight20,
                const Text(
                  'Upload your Leased Agreement',
                  style: TextStyle(fontSize: 16),
                ),
                sizedBoxHeight10,
                const ImageContainerLeasedAgreement(),
                GreenButton(
                  onTap: () {
                    bottomSheet(
                      context: context,
                    );
                  },
                  title: 'Add More Files',
                  color: cDarkBlack,
                  textColor: cWhiteColor,
                ),
                sizedBoxHeight20,
                CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: 'Back'),
                sizedBoxHeight20,
                CustomButton(
                    onTap: () {
                      BusinessProfileCreateSuccessPopup
                          driverProfileCreateSuccessPopup =
                          BusinessProfileCreateSuccessPopup();

                      driverProfileCreateSuccessPopup.showMessage(context);
                    },
                    title: 'Save & Submit'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
