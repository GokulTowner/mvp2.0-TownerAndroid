import '../../../../imports.dart';

class TotalExpenses extends StatelessWidget {
  const TotalExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2030),
                );
              },
              child: const Image(
                image: AssetImage(imgCalendar_2),
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Image(
            image: AssetImage(imgBackArrow),
          ),
        ),
        iconTheme: IconThemeData(
          color: cDarkBlack,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: textWidget(AppLocalizations.of(context)!.totalExpenditure,
            pureBlack, FontWeight.bold, 18.0, false, null, 0.0, 0.0, 0.0, 0.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewExpenditure()),
          );
        },
        backgroundColor: cMainGreen,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<TotalExpenseProvider>(
            builder: (context, provider, child) {
              List<TransactionExpense> transactionExpenses =
                  provider.filteredTransactions;
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: cLightGrey,
                    ),
                    child: ListTile(
                      title: CustomTextWidget(
                        text: AppLocalizations.of(context)!.pleaseWait,
                        size: 16.0,
                        color: cTextGrey,
                        weight: FontWeight.w500,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: cTextGrey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: cDarkBlack,
                        checkColor: cWhiteColor,
                        value: provider.withGst,
                        onChanged: (newbool) {
                          provider.setIsGst();
                        },
                      ),
                      CustomTextWidget(
                          text: AppLocalizations.of(context)!.withGstBill,
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w300),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      itemCount: transactionExpenses.length,
                      itemBuilder: (context, index) {
                        TransactionExpense transactionDetail =
                            transactionExpenses[index];
                        return Column(
                          children: [
                            sizedBoxHeight15,
                            Container(
                              height: 100,
                              color: cLightGrey,
                              child: Padding(
                                padding: pPagePadding_8,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                            text:
                                                transactionDetail.transactionId,
                                            size: 16,
                                            color: cDarkBlack,
                                            weight: FontWeight.bold),
                                        CustomTextWidget(
                                            text: transactionDetail.amount
                                                .toString(),
                                            size: 17,
                                            color: cDarkBlack,
                                            weight: FontWeight.bold),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                            text: transactionDetail.dateAndTime,
                                            size: 13,
                                            color: cTextGrey,
                                            weight: FontWeight.w500),
                                        CustomTextWidget(
                                            text:
                                                "${AppLocalizations.of(context)!.gst} : ${transactionDetail.gst}",
                                            size: 13,
                                            color: cTextGrey,
                                            weight: FontWeight.w500),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                            text: transactionDetail.status,
                                            size: 13,
                                            color: cTextGrey,
                                            weight: FontWeight.w500),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
