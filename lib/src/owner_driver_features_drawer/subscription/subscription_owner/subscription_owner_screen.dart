import '../../../../imports.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  const SubscriptionDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Consumer<SubscriptionProvider>(
              builder: (context, provider, child) => AppBar(
                title: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.subscriptionDetails),
                  ],
                ),

                leading: Container(
                  width: 30,
                  height: 30,
                  margin: pPagePadding_4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F2F6),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF707070),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                centerTitle: true,
                // backgroundColor: Colors.amber,
                bottom: TabBar(
                  controller: provider.tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: cWhiteColor,
                        blurRadius: 15,
                        offset: const Offset(-5, -5),
                      ),
                    ],
                    color: cDarkBlack,
                  ),
                  labelColor: cWhiteColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  unselectedLabelColor: cDarkBlack,
                  unselectedLabelStyle: const TextStyle(fontSize: 16),
                  tabs: [
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.currentPlans,
                            style: tsRegularText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.expiredPlans,
                            style: tsRegularText,
                          ),
                        ),
                      ),
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  onTap: (index) {},
                ),
              ),
            ),
          ),
          body: Consumer<SubscriptionProvider>(
            builder: (context, value, child) => const TabBarView(
              children: [
                Center(child: CurrentPlanWidget()),
                Center(child: ExpiredPlanWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
