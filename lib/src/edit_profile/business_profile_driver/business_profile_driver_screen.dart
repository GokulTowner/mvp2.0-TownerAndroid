import '../../../imports.dart';

class BusinessProfileDriverScreen extends StatelessWidget {
  const BusinessProfileDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const CustomHeader(title: 'Business Details'),
              sizedBoxHeight10,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          children: [
                            const Text(
                              'Business Name :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              loginProvider.driverInfoModal?.bussinessname??'',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight20,
                         Row(
                          children: [
                            const Text(
                              'Address              :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              loginProvider.driverInfoModal?.address??'',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight20,
                         const Row(
                          children: [
                            Text(
                              'Owner Name      :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight40,
                        Row(
                          children: [
                            const Text(
                              'Owner Photo      :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                    'assets/images/ownerFeature/owner_side.png')),
                          ],
                        ),
                        sizedBoxHeight20,
                        Row(
                          children: [
                            const Text(
                              'Business Logo   :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset('assets/logo/towner_logo.png'),
                            ),
                          ],
                        ),
                        sizedBoxHeight30,
                        const Row(
                          children: [
                            Text(
                              'Gst Number    :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'UJR45743GH53234',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight20,
                        const Row(
                          children: [
                            Text(
                              'Pan Number   :',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'GEYN00874563M',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight20,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
