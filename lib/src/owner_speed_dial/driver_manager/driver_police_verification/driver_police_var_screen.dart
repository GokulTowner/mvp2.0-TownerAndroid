import 'package:townerapp/imports.dart';
import 'package:townerapp/models/driver_info_modal.dart';

class DriverPoliceVarScreen extends StatelessWidget {
  final bool? isDriverProfile;

  final DriverProfileModel? driverProfile;
  final DriverDetailsModel? driverDetails;
  const DriverPoliceVarScreen(
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
          child: Consumer<DriverPolicVarProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CustomHeader(
                    title: 'Driver Police Varification',
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
                  sizedBoxHeight45,
                  CustomTextFormField(
                    readOnly: provider.isReadOnly,
                    textEditingController: provider.policeVarNo,
                    isPass: false,
                    hint: 'Driver Police Varification number',
                  ),
                  sizedBoxHeight20,
                  sizedBoxHeight45,
                  driverProfile != null && provider.isReadOnly
                      ? Image.network(
                          driverProfile!.pVerification.pVerificationImage)
                      : !context.read<LoginProvider>().isOwner &&
                              provider.isReadOnly
                          ? Image.network(
                              "driverDetails!.pVerification.pVerificationImage")
                          : const ImageContainerPoliceVar(),
                  const Spacer(),
                  CustomButton(
                      onTap: () {
                        provider.saveData(context);
                      },
                      title: 'Save'),
                  sizedBoxHeight20,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
