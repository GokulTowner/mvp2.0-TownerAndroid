import '../../../../imports.dart';

class RaiseTicketScreen extends StatefulWidget {
  const RaiseTicketScreen({super.key});

  @override
  State<RaiseTicketScreen> createState() => _RaiseTicketScreenState();
}

class _RaiseTicketScreenState extends State<RaiseTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: pPagePadding_14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: 'Raise an Issue'),
                const Text(
                  'Provide the detail below',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                sizedBoxHeight20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HighlightButton(text: 'App Issue', state: true),
                      const SizedBox(
                        width: 10,
                      ),
                      HighlightButton(text: 'Ride Issue', state: false),
                    ],
                  ),
                ),
                sizedBoxHeight10,
                Row(
                  children: [
                    HighlightButton(text: 'Payment Related', state: false),
                    const SizedBox(
                      width: 10,
                    ),
                    HighlightButton(text: 'Route Issue', state: false),
                  ],
                ),
                sizedBoxHeight20,
                const Text(
                  'Remarks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight10,
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Lorem the issue here',
                    hintStyle:
                        const TextStyle(color: Color(0xFFCACACA), fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFCACACA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFCACACA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFCACACA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                sizedBoxHeight20,
                const Text(
                  'Upload the files',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight10,
                DottedBorder(
                  strokeWidth: 1,
                  dashPattern: const [5, 2],
                  padding: EdgeInsets.zero,
                  borderType: BorderType.RRect,
                  color: const Color(0xFFa8a8a8),
                  radius: const Radius.circular(8),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  size: 48,
                                  color: Color(0xFFa8a8a8),
                                ),
                                Text(
                                  'Upload if any attachment',
                                  style: TextStyle(
                                    color: Color(0xFFa8a8a8),
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Upload the scan copy of the issue',
                              style: TextStyle(
                                color: Color(0xFFa8a8a8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxHeight20,
                sizedBoxHeight20,
                CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ReviewSuccess();
                        },
                      ).then((value) {
                        Navigator.pushNamed(context, RouteClass.homeScreen);
                      });
                    },
                    title: 'Submit Now'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
