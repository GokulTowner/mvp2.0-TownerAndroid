import '../../../../imports.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPaddingHorizontal_12,
          child: Consumer<TicketHistoryOwnerProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  sizedBoxHeight5,
                  CustomHeader(
                    title: AppLocalizations.of(context)!.ticketHistory,
                    isOption: true,
                    widgets: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: DropdownButton<String>(
                        underline: sizedBoxHeight0,
                        // hint: const Text('Filter'),
                        value: provider.selctedFilterValue,
                        items: [
                          DropdownMenuItem(
                            value: 'all',
                            child: Text(AppLocalizations.of(context)!.all),
                          ),
                          DropdownMenuItem(
                            value: 'solved',
                            child: Text(AppLocalizations.of(context)!.solved),
                          ),
                          DropdownMenuItem(
                            value: 'pending',
                            child: Text(AppLocalizations.of(context)!.pending),
                          ),
                        ],
                        onChanged: (value) {
                          provider.setFilterValue(value);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TicketContainer(
                              ticketId: 'ABC12345',
                              date: '15 sep 2023',
                              time: '12:30',
                              isPending: true,
                              remarks: '"Test"',
                              issueCategory: 'App Issue',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  sizedBoxHeight5,
                  CustomButton(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteClass.raisenewticketscreen);
                      },
                      title: AppLocalizations.of(context)!.raiseNewTicket),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
