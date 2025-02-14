import '../../../../imports.dart';

class ReferHistoryScreen extends StatelessWidget {
  const ReferHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReferHistoryProvider provider =
        Provider.of<ReferHistoryProvider>(context, listen: false);
    ReferHistoryModel? refetHistoryData = provider.referHistoryData;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: CustomHeader(
              title: AppLocalizations.of(context)!.referralHistory),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  cWhiteColor,
                  cBlueGrey50,
                ],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.totalBalance} - ',
                    style: tsRegularText,
                  ),
                  Text(
                    refetHistoryData?.totalBalance ?? '',
                    style: tsRegularTextBold,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_10,
            child: Consumer<ReferHistoryProvider>(
              builder: (context, provider, child) {
                ReferHistoryModel? refetHistoryData = provider.referHistoryData;
                return Column(
                  children: [
                    sizedBoxHeight10,
                    Card(
                      color: cBlueGrey50,
                      child: Padding(
                        padding: pPagePadding_12,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.referralTo,
                                  style: tsRegularTextBold,
                                ),
                                sizedBoxWidth5,
                                Text(
                                  refetHistoryData?.referName ?? '',
                                  style: tsRegularTextBold,
                                ),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.status}:',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontSize: 16,
                                  ),
                                ),
                                sizedBoxWidth5,
                                Text(
                                  refetHistoryData?.referStatus ?? '',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.referralCode}:',
                                    style: tsRegularText),
                                sizedBoxWidth5,
                                Text(
                                  refetHistoryData?.referCode ?? '',
                                  style: tsRegularTextBold,
                                ),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        '${AppLocalizations.of(context)!.referralTo}:',
                                        style: tsRegularText),
                                    sizedBoxWidth5,
                                    Text(refetHistoryData?.referType ?? '',
                                        style: tsRegularText),
                                  ],
                                ),
                                Text(
                                  '₹${refetHistoryData?.referralAmount ?? ''}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800),
                                ),
                              ],
                            ),
                            sizedBoxHeight5,
                            Row(
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.dateAndTime} -',
                                ),
                                sizedBoxWidth5,
                                Text(
                                  '${refetHistoryData?.referDate ?? ''} | ${refetHistoryData?.referTime ?? ''}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
