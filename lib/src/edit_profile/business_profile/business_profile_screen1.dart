import '../../../imports.dart';

class BusinessStep1 extends StatefulWidget {
  const BusinessStep1({super.key});

  @override
  State<BusinessStep1> createState() => _BusinessStep1State();
}

class _BusinessStep1State extends State<BusinessStep1> {
  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _ownerName = TextEditingController();
  // final TextEditingController _ownerPhoto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Column(
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
                              height: 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: cMainGreen,
                              ),
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
                                color: Colors.grey,
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
                  textEditingController: _businessName,
                  isPass: false,
                  hint: 'Your Business Name',
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  textEditingController: _businessName,
                  isPass: false,
                  hint: 'Business Address',
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  textEditingController: _ownerName,
                  isPass: false,
                  hint: 'Business/RC-Owner Name',
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  textEditingController: _businessName,
                  isPass: false,
                  hint: 'Travel Agency Owner Address',
                ),
                sizedBoxHeight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          color: Colors.grey[200],
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                                color: Color(0xFFA8A8A8),
                                size: 125,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Owner Photo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          color: Colors.grey[200],
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.business,
                                color: Color(0xFFA8A8A8),
                                size: 125,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Business Logo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, RouteClass.businessstep2);
                    },
                    title: 'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
