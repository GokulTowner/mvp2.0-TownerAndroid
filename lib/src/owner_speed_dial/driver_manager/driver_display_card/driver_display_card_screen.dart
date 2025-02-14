import 'package:townerapp/models/driver_info_modal.dart';

import '../../../../imports.dart';

class DriverDisplayCardScreen extends StatelessWidget {
  final bool? isDriverProfile;
  final DriverProfileModel? driverProfile;
  final DriverDetailsModel? driverDetails;
  const DriverDisplayCardScreen(
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
          child: Consumer<DriverDisplayCardProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CustomHeader(
                    title: 'Driver Display Card',
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
                    textEditingController: provider.displayCardNo,
                    isPass: false,
                    hint: 'Driver display card number',
                  ),
                  sizedBoxHeight20,
                  sizedBoxHeight45,
                  driverProfile != null && provider.isReadOnly
                      ? const SizedBox()/*Image.network(
                          driverProfile!.displayCard.displayCardImage)*/
                      : !context.read<LoginProvider>().isOwner &&
                              provider.isReadOnly
                          ? Image.network(""
                              /*driverDetails!.displayCard.displayCardImage*/)
                          : const ImageContainerDisplayCard(),
                  const Spacer(),
                  CustomButton(
                      onTap: () {
                        provider.saveCardData(context);
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
