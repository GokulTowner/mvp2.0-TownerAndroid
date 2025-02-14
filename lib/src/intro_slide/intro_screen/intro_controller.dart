import 'package:townerapp/imports.dart';

class IntroProvider extends ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);

  PageController get pageController => _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
