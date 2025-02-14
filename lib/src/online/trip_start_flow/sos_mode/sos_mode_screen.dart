import '../../../../imports.dart';

class SosModeScreen extends StatefulWidget {
  const SosModeScreen({super.key});

  @override
  State<SosModeScreen> createState() => _SosModeScreenState();
}

class _SosModeScreenState extends State<SosModeScreen> {
  bool switchState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: pPagePadding_4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF1F2F6),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  const Text(
                    'SOS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              const SizedBox(
                height: 15,
              ),
              Image.asset('assets/images/sos_logo.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Use when you are in',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                'emergency!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'SOS will send an immediate alert',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF676767),
                ),
              ),
              const Text(
                'message to the family',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF676767),
                ),
              ),
              const Text(
                'member of the people you trusted',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF676767),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SOSActivated(),
                    ),
                  );
                },
                title: 'Active Emergency',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEmergencyContacts(),
                    ),
                  );
                },
                title: 'Add Emergency Contact',
                optionalColor: Colors.grey[100],
                optionalTextColor: const Color(0xFF404040),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
