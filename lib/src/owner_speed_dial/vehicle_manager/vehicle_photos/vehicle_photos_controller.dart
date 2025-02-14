import 'dart:developer';
import '../../../../imports.dart';

class VehiclePhotosProvider extends ChangeNotifier {
  File? _front;
  File? _back;
  File? _coDriver;
  File? _driver;

  File? get front => _front;
  File? get back => _back;
  File? get coDriver => _coDriver;
  File? get driver => _driver;

  setImage(File? image, String? imageName) {
    log('Image Name : $imageName');
    if (imageName == 'front') {
      _front = image;
      notifyListeners();
    } else if (imageName == 'back') {
      _back = image;
      notifyListeners();
    } else if (imageName == 'coDriver') {
      _coDriver = image;
      notifyListeners();
    } else if (imageName == 'driver') {
      _driver = image;
      notifyListeners();
    }
  }
}
