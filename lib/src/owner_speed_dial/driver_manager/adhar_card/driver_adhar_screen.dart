import '../../../../imports.dart';
import '../../../../models/driver_info_modal.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverAadharScreen extends StatelessWidget {
  final bool? isDriverProfile;
  final DriverProfileModel? driverProfile;
  final DriverDocument? driverDetails;
  const DriverAadharScreen(
      {this.isDriverProfile,
      this.driverProfile,
      this.driverDetails,
      super.key});

  @override
  Widget build(BuildContext context) {
    // log('message${isDriverProfile.toString()}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPaddingHorizontal_12,
          child: Consumer<DriverAadharCardProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: pPaddingHorizontal_6,
                      child: CustomHeader(
                        title: 'Driver Aadhar Card',
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
                    ),
                    sizedBoxHeight45,
                    CustomTextFormField(
                      readOnly: provider.isReadOnly,
                      textEditingController: provider.name,
                      isPass: false,
                      hint: 'Full name in aadhar',
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
                      textEditingController: provider.aadharNumber,
                      isPass: false,
                      hint: 'Driver Aadhar number',
                    ),
                    sizedBoxHeight45,
                    const Text(
                      'Upload Aadhar',
                      style: tsRegularTextWithColorGrey,
                    ),
                    sizedBoxHeight5,
                    driverProfile != null && provider.isReadOnly
                        ? Image.network(driverProfile!.aadhar.adharImageOrPdf)
                        : !context.read<LoginProvider>().isOwner &&
                                provider.isReadOnly
                            ? Image.network(
                        driverDetails!.field?.firstWhere((e)=>e.slug == Slug.FRONT_IMAGE).value??'-')
                            : const ImageContainerDriverAadhar(),
                    sizedBoxHeight50,
                    CustomButton(
                        onTap: () {
                          provider.saveAdhar(context);
                        },
                        title: 'Save'),
                    sizedBoxHeight10,
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
