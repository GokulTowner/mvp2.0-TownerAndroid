import 'dart:developer';

import '../../../../imports.dart';
import '../../../../models/driver_info_modal.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverPancardScreen extends StatelessWidget {
  final bool? isDriverProfile;
  final DriverProfileModel? driverProfile;
  final DriverDocument? driverDetails;
  const DriverPancardScreen(
      {this.isDriverProfile,
      this.driverProfile,
      this.driverDetails,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPaddingHorizontal_12,
          child: Consumer<DriverPancardProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomHeader(
                        title: 'Driver Pancard Card',
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
                                          log('edit pressed');
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
                    ),
                    sizedBoxHeight45,
                    CustomTextFormField(
                      readOnly: provider.isReadOnly,
                      textEditingController: provider.name,
                      isPass: false,
                      hint: 'Full name in Pancard',
                    ),
                    sizedBoxHeight20,
                    CustomTextFormField(
                      readOnly: provider.isReadOnly,
                      textEditingController: provider.fatherName,
                      isPass: false,
                      hint: 'Father Name',
                    ),
                    sizedBoxHeight20,
                    CustomTextFormField(
                      readOnly: provider.isReadOnly,
                      textEditingController: provider.dateOfBirth,
                      isPass: false,
                      hint: 'Date of birth',
                      suffixIcon: IconButton(
                          onPressed: provider.isReadOnly
                              ? null
                              : () {
                                  provider.showDatePickerDriver(context);
                                },
                          icon: const Icon(Icons.calendar_month)),
                    ),
                    sizedBoxHeight20,
                    CustomTextFormField(
                      readOnly: provider.isReadOnly,
                      textEditingController: provider.pancardNumber,
                      isPass: false,
                      hint: 'Driver Pancard number',
                    ),
                    sizedBoxHeight45,
                    const Text(
                      'Upload Pancard',
                      style: tsRegularTextWithColorGrey,
                    ),
                    sizedBoxHeight5,
                    driverProfile != null && provider.isReadOnly
                        ? Image.network(
                            driverProfile!.pancard.panCardImageOrPdf)
                        : !context.read<LoginProvider>().isOwner &&
                                provider.isReadOnly
                            ? Image.network(driverDetails!.field!.firstWhere((e)=>e.slug==Slug.FRONT_IMAGE).value!)
                            : const ImageContainerDriverPancard(),
                    sizedBoxHeight50,
                    CustomButton(
                        onTap: () {
                          provider.savePan(context);
                        },
                        title: 'Save')
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
