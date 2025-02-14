import '../../../../imports.dart';

class AddNewFAQ extends StatelessWidget {
  const AddNewFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_10,
          child: Consumer<FAQProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              List<FaqModel> faqList = provider.faqList;
              return Column(
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.addNewFaq),
                  sizedBoxHeight20,
                  Padding(
                    padding: pPagePadding_10,
                    child: TextFormField(
                      onChanged: (value) {
                        provider.search(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: cGrey500),
                        ),
                        hintText: AppLocalizations.of(context)!.search,
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.search('');
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  sizedBoxHeight25,
                  Padding(
                    padding: pPagePadding_10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.topQuestions,
                          style: tsRegularText,
                        ),
                        Text(
                          AppLocalizations.of(context)!.addAnswer,
                          style: tsRegularTextUnderline,
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight10,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return sizedBoxHeight10;
                      },
                      itemCount: faqList.length,
                      itemBuilder: (BuildContext context, int index) {
                        FaqModel faq = faqList[index];
                        return Card(
                          color: cWhiteColor,
                          elevation: 4,
                          child: Padding(
                            padding: pPagePadding_10,
                            child: ExpansionTile(
                              title: Text(
                                faq.heading,
                                style: tsRegularText,
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        faq.faq,
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          height: 1.6,
                                        ),
                                      ),
                                      sizedBoxHeight15,
                                      Text(
                                        AppLocalizations.of(context)!
                                            .stillHaveIssues,
                                        style: tsRegularTextBold,
                                      ),
                                      sizedBoxHeight15,
                                      Row(
                                        children: [
                                          Image.asset(
                                            imgChatUs,
                                            scale: 3.5,
                                          ),
                                          sizedBoxWidth10,
                                          Text(
                                            AppLocalizations.of(context)!
                                                .chatWithUs,
                                            style: tsRegularText,
                                          ),
                                        ],
                                      ),
                                      sizedBoxHeight10,
                                      Row(
                                        children: [
                                          Image.asset(
                                            imgCallLogo,
                                            scale: 3.5,
                                          ),
                                          sizedBoxWidth10,
                                          Text(
                                            AppLocalizations.of(context)!
                                                .callUs,
                                            style: tsRegularText,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBoxHeight10,
                              ],
                            ),
                          ),
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
