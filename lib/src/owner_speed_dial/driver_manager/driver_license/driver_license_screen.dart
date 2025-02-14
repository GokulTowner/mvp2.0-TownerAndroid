import 'package:townerapp/models/driver_info_modal.dart';

import '../../../../imports.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverLicenseScreen extends StatelessWidget {
  final bool? isDriverProfile;
  final DriverProfileModel? driverProfile;
  final DriverDocument? driverDetails;
  const DriverLicenseScreen(
      {this.isDriverProfile,
      this.driverProfile,
      this.driverDetails,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<DriverLicenseProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                CustomHeader(
                  title: 'Add Driver License Details',
                  isOption: isDriverProfile == true ||
                          !context.read<LoginProvider>().isOwner
                      ? true
                      : false,
                  widgets: IconButton(
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
                                InkWell(
                                  onTap: () {
                                    provider.setIsReadOnly(false);
                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Edit'),
                                      sizedBoxWidth20,
                                      Icon(Icons.edit),
                                    ],
                                  ),
                                ),
                                sizedBoxHeight10,
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              readOnly: provider.isReadOnly,
                              textEditingController: provider.dlNumber,
                              isPass: false,
                              hint: 'DL Number'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              readOnly: provider.isReadOnly,
                              textEditingController: provider.dlValidity,
                              isPass: false,
                              hint: 'DL Validity'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              readOnly: provider.isReadOnly,
                              textEditingController: provider.badgeNumber,
                              isPass: false,
                              hint: 'Badge Number'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              readOnly: provider.isReadOnly,
                              textEditingController: provider.badgeValidity,
                              isPass: false,
                              hint: 'Badge Validity'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              readOnly: provider.isReadOnly,
                              textEditingController: provider.fatherName,
                              isPass: false,
                              hint: 'Father Name'),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            readOnly: provider.isReadOnly,
                            textEditingController: provider.dateOfBirth,
                            isPass: false,
                            hint: 'Date Of Birth',
                            suffixIcon: IconButton(
                                onPressed: provider.isReadOnly
                                    ? null
                                    : () {
                                        provider.showDatePickerDriver(context);
                                      },
                                icon:
                                    const Icon(Icons.calendar_month_outlined)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SelectRtoDropdown(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Upload DL',
                            style: TextStyle(
                                color: cTextDarkGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              driverProfile != null && provider.isReadOnly
                                  ? Image.network(driverProfile!
                                      .dlDetails.driverLicenseImageOrPdf)
                                  : !context.read<LoginProvider>().isOwner &&
                                          provider.isReadOnly
                                      ? Image.network(driverDetails!.field!.firstWhere((e)=>e.slug==Slug.FRONT_IMAGE).value!)
                                      : const ImageContainer(),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(onTap: () {
                            provider.saveLicenseData(context);
                          }, title: 'Save'),
                          const SizedBox(
                            height: 20,
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
    );
  }
}
