import '../../../imports.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({BuildContext? context}) {
    if (context != null) {
      loadSettings(context);
    }
  }

/* In load settings it will initialize the theme and language
whether if the user allread set */
  Future<void> loadSettings(BuildContext context) async {
    final settingsController =
        Provider.of<SystemSettingsController>(context, listen: false);
    settingsController.loadSettings();

    // await settingsController.loadThemeModeFromPreferences();
    // await settingsController.loadLanguageFromPreferences();
  }
}
