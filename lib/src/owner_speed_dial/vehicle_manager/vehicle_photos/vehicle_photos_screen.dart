import '../../../../imports.dart';

class VehiclePhotosScreen extends StatelessWidget {
  const VehiclePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(title: 'Vehicle Photo Upload'),
                sizedBoxHeight20,
                const Text(
                  'Front Side Photo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight5,
                const ImageViewFront(),
                sizedBoxHeight20,
                const Text(
                  'Back Side Photo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight5,
                const ImageViewBack(),
                sizedBoxHeight20,
                const Text(
                  'Co-Driver Side Photo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight5,
                const ImageViewCoDriverSide(),
                sizedBoxHeight20,
                const Text(
                  'Driver Side Photo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                sizedBoxHeight5,
                const ImageViewDriverSide(),
                sizedBoxHeight20,
                CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: 'Save')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
