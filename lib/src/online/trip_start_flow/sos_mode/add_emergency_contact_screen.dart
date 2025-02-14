import '../../../../imports.dart';

class AddEmergencyContacts extends StatefulWidget {
  const AddEmergencyContacts({super.key});

  @override
  State<AddEmergencyContacts> createState() => _AddEmergencyContactsState();
}

class _AddEmergencyContactsState extends State<AddEmergencyContacts> {
  TextEditingController controller = TextEditingController();
  bool switchState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(title: 'Add Emergency Contact'),
              sizedBoxHeight20,
              const Text(
                'Emergency Contact Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                textEditingController: controller,
                isPass: false,
                hint: 'Ramana Brother',
              ),
              sizedBoxHeight20,
              const Text(
                'Mobile number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                textEditingController: controller,
                isPass: false,
                hint: '9876543219',
                prefixIcon: SizedBox(
                  width: 50,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '+91',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFA8A8A8),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: cWhiteColor,
                        height: 30,
                        width: 1,
                      )
                    ],
                  ),
                ),
              ),
              sizedBoxHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Always share my ride detail\nwith this contact',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  CustomSwitch(
                    value: switchState,
                    inactiveColor: Colors.red,
                    inactiveTextColor: cWhiteColor,
                    activeColor: cBackgroundGreen,
                    activeTextColor: cDarkBlack,
                    activeThumbColor: cDarkBlack,
                    inactiveThumbColor: cDarkBlack,
                    onChanged: (bool value) {
                      setState(() {
                        switchState = value;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'Save as Emergency Contact'),
              sizedBoxHeight20
            ],
          ),
        ),
      ),
    );
  }
}
