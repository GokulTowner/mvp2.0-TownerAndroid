import '../../../../../imports.dart';

class QrCodeDriverRiderScreen extends StatelessWidget {
  const QrCodeDriverRiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qrDriverRiderProvider = Provider.of<QrDriverRiderProvider>(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'QR Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: qrDriverRiderProvider.isclicked
                        ? cDarkBlack
                        : cDarkBlack,
                  ),
                  labelColor: cWhiteColor,
                  unselectedLabelColor: cDarkBlack,
                  tabs: [
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'My Code',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Scan',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              MyCodeTab(),
              ScanTab(),
            ],
          ),
        ),
      ),
    );
  }
}

void scanQRCode() async {
  try {
    // ignore: unused_local_variable
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);

    // if (!mounted) return;

    // setState(() {
    //   getResultQr = qrCode;
    // });
  } on PlatformException {
    // getResultQr = 'Failed to scan QR Code.';
  }
}
