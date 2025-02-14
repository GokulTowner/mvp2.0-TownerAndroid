import '../../../../../imports.dart';

class MyCodeTab extends StatelessWidget {
  const MyCodeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final qrProvider = Provider.of<QrDriverRiderProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxHeight40,
        QrDriverContainer(
          callBack: () {},
          leadWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assetst/avtar_dp.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          isBorder: false,
          subWidget: const Text(
            'AP 28 DC 3366',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          title: 'Hey, Swaminathan',
        ),
        const SizedBox(height: 70),
        Center(
          child: QrImageView(
            data: 'Towner driver qr code',
            version: QrVersions.auto,
            size: 250,
            gapless: false,
          ),
        )
      ],
    );
  }
}
