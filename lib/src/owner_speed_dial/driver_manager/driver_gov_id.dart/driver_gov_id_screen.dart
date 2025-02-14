import '../../../../imports.dart';

class DriverGovIdScreen extends StatelessWidget {
  const DriverGovIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomHeader(title: 'Driver Gov. Id'),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<DriverGovIdProvider>(
                  builder: (context, provider, child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              textEditingController: provider.panNumber,
                              isPass: false,
                              hint: 'Pan Number'),
                          const SizedBox(
                            height: 20,
                          ),

                          const Text(
                            'Upload Pan Card',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const ImageShowContainerPanCard(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            textEditingController: provider.panNumber,
                            isPass: false,
                            hint: 'Voter Id',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ),
                          const Text(
                            'Upload Voter ID',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const ImageShowContainerVoterId(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              textEditingController: provider.panNumber,
                              isPass: false,
                              hint: 'Adhaar Number'),
                          const SizedBox(
                            height: 20,
                          ),
                          // ),
                          const Text(
                            'Upload Adhaar',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          const ImageShowContainerAdhar(),
                          sizedBoxHeight20,
                          CustomButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: 'Submit'),
                          sizedBoxHeight20
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
