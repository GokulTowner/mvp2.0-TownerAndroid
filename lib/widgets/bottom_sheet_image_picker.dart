import 'dart:developer';
import '../../../../imports.dart';

/* This is the common bottom sheet. we can use it any screen.
 Remember befor using it you should initialize the provider.
  then assing the provider object in to that
 after you have to pass the object of the proveider and context as positional
 parameter. then initialize the varible in provider class and use it.
 here bottom sheet is connected with the get image function so don't 
 call the getimage function anywhere in the aplication */

Future<Widget?> bottomSheet(
    {required BuildContext context,
    dynamic provider,
    String? imageName,
    bool? isPdf}) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.grey.shade900,
    // barrierColor: Colors.blue,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 250,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade700)),
                  onPressed: () {
                    // get image is calling from here and its for to access camera
                    getImage(ImageSource.camera, context, provider, imageName);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        const IconData(0xf60b, fontFamily: 'MaterialIcons'),
                        size: 25,
                        color: cWhiteColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Use a Camera ',
                        style: TextStyle(color: cWhiteColor),
                      )
                    ],
                  ),
                ),
                sizedBoxHeight20,
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade700)),
                  onPressed: () {
                    log('image name in gallery select : $imageName');
                    // get image is calling from here and its for to access gallery
                    getImage(ImageSource.gallery, context, provider, imageName);
                    log('gallery image name: $imageName');
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 25, color: cWhiteColor),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('Browse Gallery',
                          style: TextStyle(color: cWhiteColor)),
                    ],
                  ),
                ),
                sizedBoxHeight20,
                isPdf == true
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade700),
                        ),
                        onPressed: () {
                          // get Pdf is calling from here and its for to access pdf files.

                          log('imageName in pdf: $imageName');
                          pickPdf(context, provider, imageName);
                          if (imageName == null) {
                            provider.setImageNull();
                          } else {
                            provider.setImageNull(imageName);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.picture_as_pdf_rounded,
                                size: 25, color: cWhiteColor),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Select PDF File',
                                style: TextStyle(color: cWhiteColor)),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future getImage(ImageSource imageSource, BuildContext context, dynamic provider,
    String? imageName) async {
  var image = await ImagePicker().pickImage(source: imageSource);
  if (image == null) return;
  final imageTemporary = File(image.path);
  log('image name: ${imageName.toString()}');
  // Here it will set the image at the prefered provider class
  provider.setImage(imageTemporary, imageName);
}

Future<void> pickPdf(
    BuildContext context, dynamic provider, String? pdfName) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null) {
    File selectedPdf = File(result.files.single.path!);

    // provider.setPdf(selectedPdf,pdfName);
    log('Pdf Name: $pdfName');
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewer(
          provider: provider,
          selectedPdf: selectedPdf,
          pdfName: pdfName,
        ),
      ),
    );
  }
}
