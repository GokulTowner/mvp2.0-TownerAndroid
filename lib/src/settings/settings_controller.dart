import 'dart:developer';

import '../../imports.dart';

class SystemSettingsController extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();

  Locale? _lang;
  Locale get language => _lang ?? const Locale('en');

  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;

  String? _userState;
  String? get userState => _userState ?? 'Select State';

  String? _userCity;
  String? get userCity => _userCity ?? 'Select City';

  Future<void> loadSettings() async {
    loadThemeModeFromPreferences();
    loadLanguageFromPreferences();
  }

  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    localStorageService.setThemeMode(newThemeMode.index);
    notifyListeners();
  }

  Future<void> loadThemeModeFromPreferences() async {
    int themeModeIndex = localStorageService.getThemMode;
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }

  Future<void> updateLanguage(Locale? newLang) async {
    if (newLang == null) return;

    if (newLang == _lang) return;
    _lang = newLang;
    notifyListeners();

    localStorageService.setLanguage(
        newLang.languageCode, newLang.countryCode ?? '');
  }

  Future<void> loadLanguageFromPreferences() async {
    Locale language = localStorageService.language;
    _lang = language;

    log('Language code : ${language.languageCode}');
    log('Country code : ${language.countryCode}');
    notifyListeners();
  }

  Future<void> updateState(String? newState) async {
    if (newState == null) return;

    _userState = newState;
    notifyListeners();
  }

  Future<void> updateCity(String? newCity) async {
    if (newCity == null) return;

    _userCity = newCity;
    notifyListeners();
  }
}
