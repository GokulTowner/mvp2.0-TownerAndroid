import '../../../../imports.dart';

class SheduledTripScreen extends StatelessWidget {
  const SheduledTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              children: [
                sizedBoxHeight10,
                Padding(
                  padding: pPaddingHorizontal_8,
                  child: CustomHeader(
                      title: AppLocalizations.of(context)!.scheduled),
                ),
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.scheduled,
                        style: tsSmallText,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.interested,
                        style: tsSmallText,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.accepted,
                        style: tsSmallText,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 122,
                  child: const TabBarView(
                    children: [
                      SheduledTab(),
                      ScheduledIterested(),
                      AcceptedRide(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
