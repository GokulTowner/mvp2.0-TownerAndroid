import '../../../../../imports.dart';

class NewExpenditure extends StatefulWidget {
  const NewExpenditure({super.key});

  @override
  State<NewExpenditure> createState() => _NewExpenditureState();
}

class _NewExpenditureState extends State<NewExpenditure> {
  @override
  Widget build(BuildContext context) {
    final addNewExpenditureProvider = context.read<AddNewExpenditureProvider>();
    final addNewExpenditureProviderWatch =
        context.watch<AddNewExpenditureProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<AddNewExpenditureProvider>(
              builder: (context, provider, child) {
            return Column(
              children: [
                CustomHeader(
                    title: AppLocalizations.of(context)!.addExpenditure),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                          text:
                              '* ${AppLocalizations.of(context)!.selectExpenditure}',
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w500),

                      CustomDropdownExpenditureWidget(
                        hint: AppLocalizations.of(context)!.selectExpenditure,
                        dataList: provider.expenditureList,
                        selectedValue: provider.selectedExpenditure,
                      ),

                      CustomTextWidget(
                          text:
                              '* ${AppLocalizations.of(context)!.amountOfExpenses}',
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w500),

                      CustomTextFormField(
                          textEditingController: provider.gstAmount,
                          isPass: false,
                          hint: AppLocalizations.of(context)!
                              .enterAmountOfExpenses),

                      CustomTextWidget(
                          text: AppLocalizations.of(context)!.pleaseSelect,
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w500),
                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: addNewExpenditureProviderWatch.isGst,
                                onChanged: (newbool) {
                                  addNewExpenditureProvider.setIsGst();
                                },
                              ),
                              CustomTextWidget(
                                  text:
                                      AppLocalizations.of(context)!.withGstBill,
                                  size: 16,
                                  color: cDarkBlack,
                                  weight: FontWeight.w500),
                            ],
                          ),
                        ],
                      ),
                      addNewExpenditureProviderWatch.isGst == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                    text:
                                        AppLocalizations.of(context)!.gstNumber,
                                    size: 16,
                                    color: cDarkBlack,
                                    weight: FontWeight.w500),
                                sizedBoxHeight5,
                                CustomTextFormField(
                                    textEditingController: provider.gstAmount,
                                    isPass: false,
                                    hint: AppLocalizations.of(context)!
                                        .enterGstAmount),
                                sizedBoxHeight5,
                                CustomTextWidget(
                                    text:
                                        AppLocalizations.of(context)!.gstAmount,
                                    size: 16,
                                    color: cDarkBlack,
                                    weight: FontWeight.w500),
                                CustomTextFormField(
                                    textEditingController: provider.gstAmount,
                                    isPass: false,
                                    hint: AppLocalizations.of(context)!
                                        .enterGstAmount),
                              ],
                            )
                          : const SizedBox(),
                      CustomTextWidget(
                          text: '* ${AppLocalizations.of(context)!.remarks}',
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w500),

                      // dropDownMenu("Lore opsom info the cap should", context),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextWidget(
                          text: AppLocalizations.of(context)!.billUploading,
                          size: 16,
                          color: cDarkBlack,
                          weight: FontWeight.w500),

                      const SizedBox(
                        height: 10.0,
                      ),
                      const ImageContainerExpenditure(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      sizedBoxHeight20,
                      sizedBoxHeight20,
                      CustomButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ExpenditureSuccessful(),
                              ),
                            );
                          },
                          title: AppLocalizations.of(context)!.uploadExpenses)
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
