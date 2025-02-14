import 'dart:developer';
import '../imports.dart';

class PdfViewer extends StatelessWidget {
  final dynamic provider;
  final File selectedPdf;
  final String? pdfName;
  const PdfViewer(
      {this.pdfName, this.provider, required this.selectedPdf, super.key});

  @override
  Widget build(BuildContext context) {
    log('Provider name : ${provider.toString()}');
    log('selected pdf :${selectedPdf.toString()}');
    log('Pdf name : ${pdfName.toString()}');
    return Column(
      children: [
        Expanded(
          child: PDFView(
            filePath: selectedPdf.path,
            //  context.read<DriverLicenseProvider>().dlPdf!.path,
            enableSwipe: true,
            onPageChanged: (page, total) {
              Text('Page $page');
            },
          ),
        ),
        CustomButton(
            onTap: () {
              provider.setPdf(selectedPdf, pdfName);
              if (pdfName == null) {
                provider.getLastPdfPathName();
              } else {
                provider.getLastPdfPathName(pdfName);
              }
              Navigator.pop(context);
              Navigator.pop(context);
            },
            title: 'Select PDF'),
      ],
    );
  }
}
