import '../../../../imports.dart';

class QRCodePaymentScreen extends StatelessWidget {
  const QRCodePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pPagePadding_12,
          child: Column(
            children: [
              const CustomHeader(title: 'QR Code'),
              const SizedBox(
                height: 30,
              ),
              // Image.asset('assets/qr_code.png'),
              // const SizedBox(
              //   height: 50,
              // ),
              QrImageView(
                data: '12000',
                version: QrVersions.auto,
                size: 250,
                gapless: false,
              ),
              Container(
                color: Colors.grey[100],
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        'Amount to be paid',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '₹ 12000.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.green),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Booking ID MTC000011',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFa8a8a8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                    context.read<CreateInvoiceProvider>().setIsAmountPaid(true);
                    Navigator.pop(context, true);
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CreateInvoiceScreen(flag: 1),
                    //   ),
                    // );
                  },
                  title: 'Next'),
              sizedBoxHeight20,
            ],
          ),
        ),
      ),
    );
  }
}
