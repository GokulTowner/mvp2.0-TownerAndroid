import '../../../../../imports.dart';

class ScanTab extends StatelessWidget {
  const ScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          scanQRCode();
        },
        child: Text(
          'Click here to scan QR code',
          style: TextStyle(fontSize: 16, color: cBlueMain),
        ),
      ),
    );
  }
}
