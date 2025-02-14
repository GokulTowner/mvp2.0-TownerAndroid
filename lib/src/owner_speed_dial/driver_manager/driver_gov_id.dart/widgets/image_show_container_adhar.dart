import '../../../../../imports.dart';

class ImageShowContainerAdhar extends StatelessWidget {
  const ImageShowContainerAdhar({super.key});

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<DriverGovIdProvider>();
    return Consumer<DriverGovIdProvider>(
      builder: (context, provider, child) {
        return provider.adhar == null && provider.adharPdf != null
            ? InkWell(
                onTap: () {
                  bottomSheet(
                      context: context,
                      provider: provider,
                      isPdf: true,
                      imageName: 'adhar');
                  provider.getLastPdfPathName('adhar');
                },
                child: Column(
                  children: [
                    SizedBox(
                        height: 70,
                        child: Image.asset('assets/images/pdf_upload.jpg')),
                    Text(
                      ' ${providerWatch.selectedPdfAdhar}',
                    ),
                  ],
                ),
              )
            : DottedBorder(
                radius: const Radius.circular(5),
                strokeWidth: 1,
                dashPattern: const [5, 5],
                color: cTextGrey,
                child: InkWell(
                  onTap: () {
                    bottomSheet(
                        context: context,
                        provider: provider,
                        isPdf: true,
                        imageName: 'adhar');
                    provider.getLastPdfPathName('adhar');
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: cLightGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: provider.adhar == null
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
                                          isPdf: true,
                                          imageName: 'adhar');
                                    },
                                    child: SizedBox(
                                      height: 250,
                                      width: 350,
                                      child: Image.file(
                                        provider.adhar!,
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
