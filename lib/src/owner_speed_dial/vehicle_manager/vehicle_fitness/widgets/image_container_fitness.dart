import '../../../../../imports.dart';

class ImageContainerFitness extends StatelessWidget {
  const ImageContainerFitness({super.key});

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<VehicleFitnessProvider>();
    return Consumer<VehicleFitnessProvider>(
      builder: (context, provider, child) {
        return provider.fitnessImage == null && provider.fitnessPdf != null
            ? InkWell(
                onTap: () {
                  bottomSheet(
                      context: context, provider: provider, isPdf: true);
                  provider.getLastPdfPathName();
                },
                child: Column(
                  children: [
                    SizedBox(
                        height: 70,
                        child: Image.asset('assets/images/pdf_upload.jpg')),
                    Text(
                      ' ${providerWatch.selectedPdfLastPath}',
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
                        context: context, provider: provider, isPdf: true);
                    provider.getLastPdfPathName();
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: cLightGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: provider.fitnessImage == null
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
                                          isPdf: true);
                                    },
                                    child: SizedBox(
                                      height: 250,
                                      width: 350,
                                      child: Image.file(
                                        provider.fitnessImage!,
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
