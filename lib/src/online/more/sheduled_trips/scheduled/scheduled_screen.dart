import '../../../../../../imports.dart';

class ScheduledScreen extends StatelessWidget {
  const ScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: pPaddingHorizontal_10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: MediaQuery.of(context).size.height - 200,
                child: const TabBarView(
                  children: [
                    SheduledTab(),
                    ScheduledIterested(),
                    AcceptedRide(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
