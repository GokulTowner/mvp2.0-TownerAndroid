import '../../../../../imports.dart';

class WithdrawSuccess extends StatelessWidget {
  const WithdrawSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: cWhiteColor,
        ),
        iconTheme: IconThemeData(
          color: cDarkBlack,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: textWidget('Successful', pureBlack, FontWeight.bold, 18.0, false,
            null, 0.0, 0.0, 0.0, 0.0),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          const Image(
            image: AssetImage('assets/images/success.png'),
          ),
          textWidget('5,000', pureBlack, FontWeight.bold, 45.0, false, null,
              0.0, 30.0, 0.0, 0.0),
          textWidget('Tran. ID: ABC123456', cTextGrey, FontWeight.bold, 16.0,
              false, null, 0.0, 10.0, 0.0, 0.0),
          textWidget('Ac. N.:**** **** *123', cDarkBlack, FontWeight.bold, 22.0,
              false, null, 0.0, 10.0, 0.0, 0.0),
          textWidget('Swaminathan', cTextGrey, FontWeight.w500, 18.0, false,
              null, 0.0, 10.0, 0.0, 0.0),
          textWidget('Your request of withdraw money', cTextGrey,
              FontWeight.w500, 20.0, false, null, 0.0, 30.0, 0.0, 0.0),
          textWidget('has been successfully done.', cTextGrey, FontWeight.w500,
              20.0, false, null, 0.0, 10.0, 0.0, 0.0),
        ],
      ),
    );
  }
}
