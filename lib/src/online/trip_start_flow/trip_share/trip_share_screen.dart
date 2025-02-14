import '../../../../imports.dart';

class TripShareScreen extends StatelessWidget {
  const TripShareScreen({super.key});

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank You for sharing Towner',
      chooserTitle: 'Share via',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pPagePadding_10,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: 'Trip Share'),
                sizedBoxHeight20,
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Image.asset('assets/images/girl_dp.png'),
                        title: const Text(
                          'Sruthi Agrawal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: const Text(
                          '⭐ 4.5 Since 2019',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      '8736972639',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                sizedBoxHeight20,
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Towner Cab - Ongoing trip Id: Tblr2022123',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Vehicle no. KA 51MC 9348 / Sedan',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'From JP Nagar - To: Marathahalli',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'https://towner.com/track/',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            '290848',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'click this link and track live ride',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                sizedBoxHeight50,
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/google.png',
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight20,
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/facebook.png',
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight20,
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/linkedin.png',
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Linkedin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight20,
                sizedBoxHeight50,
                CustomButton(
                  onTap: () {
                    shareFunction();
                    Navigator.pop(context);
                  },
                  title: 'Share Now',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
