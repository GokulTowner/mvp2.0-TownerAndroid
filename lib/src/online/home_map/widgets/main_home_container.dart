import '../../../../imports.dart';

class MainHomeContainer extends StatelessWidget {
  const MainHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: cDarkBlack,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: pPagePadding_10,
                  child: Text(
                    'Waiting for rides....',
                    style: TextStyle(
                      color: cMainGreen,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 50,
                //   child: Lottie.asset('assets/lottie/towner_car1.json'),
                // )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[700],
            ),
            child: Column(
              children: [
                sizedBoxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteClass.scheduledtripscreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Text(
                            'Scheduled Ride',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CreateTripContainer();
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Text(
                            'Create Own Trip',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight20
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IncomingRideContainer(),
                ),
              );
            },
            child: Column(
              children: [
                sizedBoxHeight5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sizedBoxHeight0,
                    Text(
                      'Today so far',
                      style: TextStyle(
                        color: cDarkBlack,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        autofocus: true,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteClass.qrcodedriverriderscreen);
                        },
                        icon: const Icon(
                          Icons.qr_code_2_outlined,
                          size: 35,
                          // color: cDarkBlack,
                        ),
                      ),
                    )
                  ],
                ),
                sizedBoxHeight15,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fiber_manual_record_outlined,
                          size: 28,
                          color: Color(0xFF676767),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '4 Trips',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFF676767),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '04:30',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_outlined,
                          color: Color(0xFF676767),
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '120.00',
                          style: TextStyle(
                            color: Color(0xFF676767),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFf1f2f6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.asset('assets/images/dp1.png'),
                      title: const Text(
                        'Hey, Swaminathan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('AP 28 CD 3366 | Sedan'),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: cWhiteColor,
                        child: Image.asset('assets/images/car.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
