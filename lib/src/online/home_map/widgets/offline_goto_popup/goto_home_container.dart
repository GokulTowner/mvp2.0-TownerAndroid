import '../../../../../imports.dart';

class GoHomeContainer extends StatelessWidget {
  const GoHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.85,
          widthFactor: 1.1,
          child: Dialog(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: cWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Are You Sure you want',
                        style: TextStyle(
                          color: cDarkBlack,
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'to ',
                            style: TextStyle(
                              color: cDarkBlack,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'goto home',
                            style: TextStyle(
                                color: cDarkBlack,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ?',
                            style: TextStyle(
                              color: cDarkBlack,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight20,
                      Image.asset('assets/images/goto_icon.png'),
                      sizedBoxHeight30,
                      const Text(
                        'This makes you to go back to your home location and will provide you trips towards home location if any.',
                        style: TextStyle(
                            color: Color(0xFF676767),
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            height: 1.5),
                      ),
                      sizedBoxHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              context
                                  .read<BottomNavigationProvider>()
                                  .setIndex(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFa8a8a8),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<BottomNavigationProvider>()
                                  .setIsGotoHome(true);
                              context
                                  .read<BottomNavigationProvider>()
                                  .setIndex(1);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cBackgroundGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                child: Center(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
