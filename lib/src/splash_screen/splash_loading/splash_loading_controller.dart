import 'dart:developer';
import '../../../imports.dart';

class SplashLoadingProvider extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();
  double _progressValue = 0.0;

  double get progressValue => _progressValue;

  void initialSetup(BuildContext context) {
    // localStorageService.init();
    // loadSettings(context);
    checkIsLoggedIn(context);
  }

  //initial commit
  Future<void> startProgressAnimation(BuildContext context) async {
    Timer.periodic(
      const Duration(microseconds: 900),
      (timer) {
        if (_progressValue > 4) {
          timer.cancel();
          initialSetup(context);
        } else {
          _progressValue += 0.0001;
          notifyListeners();
        }
      },
    );
  }

  // Future<void> loadSettings(BuildContext context) async {
  //   final settingsController =
  //       Provider.of<SettingsController>(context, listen: false);
  //   await settingsController.loadThemeModeFromPreferences();
  //   await settingsController.loadLanguageFromPreferences();
  // }

  Future<void> checkIsLoggedIn(BuildContext context) async {
    String? token = localStorageService.token;
    bool? isOwner = localStorageService.isowner;
    log('message : $isOwner');
    log('token : $token');

    if (token == "invalid") {
      checkFirstTime(context);
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          if (isOwner == true) {
            context.read<LoginProvider>().setIsOwnerTrue();
            context.read<LoginProvider>().getOwnerDataFromSharedPref();
          } else {
            context.read<LoginProvider>().getDriverDataFromSharedPref();
          }
          isOwner == true
              ? Navigator.pushNamedAndRemoveUntil(
                  context, RouteClass.landingScreenOwner, (route) => false)
              : Navigator.pushNamedAndRemoveUntil(
                  context, RouteClass.landingScreenDriver, (route) => false);
        },
      );
    }
  }

  void checkFirstTime(BuildContext context) async {
    bool? isFirstLogin = localStorageService.getfirstTime();

    log('isFirstLogin : $isFirstLogin');
    if (isFirstLogin == false) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.indroscreen, (route) => false);
    } else {
      bool? isOwner = localStorageService.isowner;
      log("isOwner : $isOwner");
      if (isOwner == true) {
        setIsOwnerTrue(context);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteClass.ownerDriverSelectionScreen, (route) => false);
      } else {
        callSetIsOwnerfalse(context);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteClass.ownerDriverSelectionScreen, (route) => false);
      }
    }
  }

  void setIsOwnerTrue(BuildContext context) {
    context.read<LoginProvider>().setIsOwnerTrue();
  }

  void callSetIsOwnerfalse(BuildContext context) {
    context.read<LoginProvider>().setIsOwnerFalse();
  }
}
