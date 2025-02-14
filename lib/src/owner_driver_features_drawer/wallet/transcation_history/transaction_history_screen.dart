import '../../../../imports.dart';

class TransctionHistoryScreen extends StatelessWidget {
  const TransctionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletTransactionHistoryProvider =
        Provider.of<TransactionHistoryProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<TransactionHistoryProvider>(
            builder: (context, provider, child) {
              TransactionHistoryModel transactionHistoryModel =
                  provider.transactionHistory;
              List<Transactions> transactions =
                  transactionHistoryModel.transactions;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomHeader(title: AppLocalizations.of(context)!.history),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textEditingController:
                        walletTransactionHistoryProvider.selectedDate,
                    isPass: false,
                    hint: AppLocalizations.of(context)!.selectDate,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget('Sep 06, 2022', pureBlack, FontWeight.w700,
                          18.0, false, null, 0.0, 20.0, 0.0, 10.0),
                      textWidget('Sort', pureBlack, FontWeight.w700, 18.0,
                          false, null, 0.0, 20.0, 0.0, 10.0),
                    ],
                  ),
                  // Listview builder
                  Expanded(
                    child: ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          Transactions transaction = transactions[index];
                          return historyListTile(
                            context,
                            leadingImage: imgGoing,
                            title: transaction.title,
                            subtitle: transaction.subtitle,
                            trailingTitle: transaction.trailingTitle,
                            trailingIcon: Icons.arrow_forward_ios,
                            dateTime: transaction.dateTime,
                            status: transaction.status,
                          );
                        }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
