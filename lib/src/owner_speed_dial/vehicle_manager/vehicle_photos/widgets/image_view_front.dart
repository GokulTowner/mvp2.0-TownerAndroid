import '../../../../../imports.dart';

class ImageViewFront extends StatelessWidget {
  const ImageViewFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehiclePhotosProvider>(
      builder: (context, provider, child) {
        return DottedBorder(
          radius: const Radius.circular(5),
          strokeWidth: 1,
          dashPattern: const [5, 5],
          color: cTextGrey,
          child: InkWell(
            onTap: () {
              bottomSheet(
                  context: context, provider: provider, imageName: 'front');
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: cLightGrey, borderRadius: BorderRadius.circular(5)),
              child: provider.front == null
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: 40,
                        ),
                        Text('Upload The Files')
                      ],
                    )
                  : Stack(
                      children: [
                        Positioned(
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                bottomSheet(
                                    context: context,
                                    provider: provider,
                                    imageName: 'front');
                              },
                              child: SizedBox(
                                height: 250,
                                width: 350,
                                child: Image.file(
                                  provider.front!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
