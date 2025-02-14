import '../../../imports.dart';

class OwnerLandingProvider extends ChangeNotifier {
  final List<String> _imageUrls = [
    'assets/images/carouser_1.jpg',
    'assets/images/carousel_2.jpg',
    'assets/images/carousel_3.jpg',
    'assets/images/carousel_4.jpg'
  ];

  List<String> get imageUrls => _imageUrls;

  String? imageUrl;
}
