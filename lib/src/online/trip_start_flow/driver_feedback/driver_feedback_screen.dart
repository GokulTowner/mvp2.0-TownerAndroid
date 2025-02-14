import '../../../../imports.dart';

enum FeedbackType {
  cleanliness('Cleanliness'),
  location('Location'),
  behaviour('Behaviour'),
  goodCustomer('Good Customer'),
  averageCustomer('Average Customer'),
  worstCustomer('Worst Customer');

  final String text;

  const FeedbackType(this.text);

  // Helper method to get enum from text
  static FeedbackType? fromText(String text) {
    return values.firstWhere(
          (element) => element.text.toLowerCase() == text.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid feedback text: $text'),
    );
  }

  // Helper method to get text from enum
  static String getText(FeedbackType? type) {
    return type?.text ?? '';
  }
}

class DriverFeedbackScreen extends StatefulWidget {
  const DriverFeedbackScreen({super.key});

  @override
  State<DriverFeedbackScreen> createState() => _DriverFeedbackScreenState();
}

class _DriverFeedbackScreenState extends State<DriverFeedbackScreen> {
  bool checkBoxState = false;

  int? selectedIssueIndex;
  FeedbackType? selectedFeedback;

  void setSelectedIssue(int? index, FeedbackType type) {
    setState(() {
      selectedIssueIndex = index;
      selectedFeedback = type;
    });
  }

  double rating = 4.5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_14,
          child: Center(
            child: Consumer<IntripProvider>(
              builder: (BuildContext context, provider, Widget? child) {

                return Column(
                  children: [
                    sizedBoxHeight50,
                    Image.asset('assets/images/girldp_large.png'),
                    sizedBoxHeight15,
                    const Text(
                      'Shruthi Agrawal',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    sizedBoxHeight20,
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double rating) {
                        this.rating = rating;
                      },
                    ),
                    sizedBoxHeight30,
                    Container(
                      height: 1.3,
                      color: const Color(0xFFb3b5bb),
                      width: double.infinity,
                    ),
                    sizedBoxHeight20,
                    const Text(
                      'But having an issue with',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    sizedBoxHeight20,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HighlightButton(
                              text: FeedbackType.cleanliness.text,
                              onTap: (){
                                setState(() {
                                  setSelectedIssue(0,FeedbackType.cleanliness);

                                });
                              },
                              state: selectedIssueIndex == 0),
                          const SizedBox(
                            width: 10,
                          ),
                          HighlightButton(
                              text: FeedbackType.location.text,
                              onTap: (){
                                setState(() {
                                  setSelectedIssue(1,FeedbackType.location);
                                });
                              },
                              state: selectedIssueIndex == 1),
                          const SizedBox(
                            width: 10,
                          ),
                          HighlightButton(
                              text: FeedbackType.behaviour.text,
                              onTap: (){
                                setState(() {
                                  setSelectedIssue(2,FeedbackType.behaviour);
                                });
                              },
                              state: selectedIssueIndex == 2)
                        ],
                      ),
                    ),
                    sizedBoxHeight10,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HighlightButton(
                              text: FeedbackType.goodCustomer.text,
                              onTap: (){
                                setState(() {
                                  setSelectedIssue(3,FeedbackType.goodCustomer);
                                });
                              },
                              state: selectedIssueIndex == 3),
                          const SizedBox(
                            width: 10,
                          ),
                          HighlightButton(
                              text: FeedbackType.averageCustomer.text,
                              onTap: (){
                                setState(() {
                                  setSelectedIssue(4,FeedbackType.averageCustomer);
                                });
                              },
                              state: selectedIssueIndex == 4),
                        ],
                      ),
                    ),
                    sizedBoxHeight10,
                    Row(
                      children: [
                        HighlightButton(
                            text: FeedbackType.worstCustomer.text,
                            onTap: (){
                              setState(() {
                                setSelectedIssue(5,FeedbackType.worstCustomer);
                              });
                            },
                            state: selectedIssueIndex == 5),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Checkbox(
                          value: checkBoxState,
                          onChanged: (value) {
                            setState(() {
                              checkBoxState = !checkBoxState;
                            });
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const RaiseAnIssue(),
                            //   ),
                            // );
                          },
                          activeColor: cBackgroundGreen,
                          checkColor: cDarkBlack,
                        ),
                        const Text(
                          'Raise Ticket',
                          style: TextStyle(fontSize: 16, color: Color(0xFf676767)),
                        ),
                      ],
                    ),
                    CustomButton(
                        onTap: () {
                          if (checkBoxState != true) {

                            if(selectedIssueIndex== null){
                              return;
                            }
                            String selectedText = FeedbackType.getText(selectedFeedback);
                            provider.addSupport(context, selectedText, rating);
                          } else {
                            Navigator.pushNamed(
                                context, RouteClass.raiseticketscreen);
                          }
                        },
                        title: 'Submit Feedback'),
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
