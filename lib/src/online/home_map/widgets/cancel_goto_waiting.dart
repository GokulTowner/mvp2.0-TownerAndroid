import '../../../../imports.dart';

class CancelGotoWaiting extends StatelessWidget {
  const CancelGotoWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: cBackgroundGreen,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: pPagePadding_8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1 hr 22 min',
                        style: TextStyle(
                            color: cDarkBlack,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      sizedBoxWidth5,
                      Text(
                        '12 Km | 10:10 am',
                        style: TextStyle(
                          color: cDarkBlack,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 15),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const IncomingRideContainer();
                          },
                        ).then(
                          (value) {
                            if (value == true) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const EstimationRideContainer(
                                    tripType: 'Daily Ride',
                                  );
                                },
                              ).then(
                                (value) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const OTPWaiting();
                                    },
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cWhiteColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.navigation_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Go To Home',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Searching for rides\nTowards home',
                        style: TextStyle(
                          color: cDarkBlack,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: CustomButton(
                      onTap: () {
                        // Navigator.pop(context);
                        context.read<BottomNavigationProvider>().setIndex(2);
                        context
                            .read<BottomNavigationProvider>()
                            .setIsGotoHome(false);

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomeMapScreen(),
                        //   ),
                        // );
                      },
                      title: 'Cancel Goto',
                      optionalColor: cDarkBlack,
                      optionalTextColor: cWhiteColor,
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
