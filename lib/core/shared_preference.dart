import 'dart:developer';

import 'package:townerapp/models/driver_info_modal.dart';
import 'package:townerapp/models/driver_login_modal.dart';

import '../imports.dart';

enum _Key {
  firstTime,
  isLoggedIn,
  userOwner,
  userDriver,
  userDriverProfile,
  isOwner,
  token,
  lastVisited,
  tripId,
}

class LocalStorageService extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;

  // init should initialize through cunstructor when local storage service call
  LocalStorageService() {
    init();
  }
/* initializing shared preference */
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  // ***************************************************************************

  /* User Last visited screen state for navigate to that screen if user kill the aplication
  from some particular screens */

  Future<String> getLastVisited() async {
    if (_sharedPreferences == null) {
      await init();
    }
    var res = _sharedPreferences?.getString(_Key.lastVisited.toString());
    log('Last Visited : $res');
    return res ?? '/';
  }

  navigateToNextScreen(BuildContext context, String routeName) async {
    if (_sharedPreferences == null) {
      await init();
    }

    // final String lastVisitedKey = _Key.lastVisited.toString();
    _sharedPreferences?.setString(_Key.lastVisited.toString(),
        routeName.toString()); // Save the last visited screen

    log('Route Name : $routeName');
    log('lastVisited : ${_sharedPreferences?.getString(_Key.lastVisited.toString())}');
    Navigator.pushNamed(context, routeName);
  }

  removeLastVisitedScreen() async {
    if (_sharedPreferences == null) {
      await init();
    }
    await _sharedPreferences?.remove(_Key.lastVisited.toString());
    log('lastVisited : ${_sharedPreferences?.getString(_Key.lastVisited.toString())}');
  }

  // ***************************************************************************

  /* users first state for intro store and get function  */

  bool getfirstTime() {
    var res = _sharedPreferences?.getBool(_Key.firstTime.toString());
    log('res : $res');
    return res ?? false;
  }

  setfirstTime(bool state) {
    _sharedPreferences?.setBool(_Key.firstTime.toString(), state);

    log('set isFirst: ${_sharedPreferences?.getBool(_Key.firstTime.toString())}');
  }

// ***************************************************************************

/* user owner or driver state store and get function  */

  bool get isowner {
    var res = _sharedPreferences?.getBool(_Key.isOwner.toString());
    return res ?? false;
  }

  setisOwner(bool state) {
    _sharedPreferences?.setBool(_Key.isOwner.toString(), state);

    log('IsLoggedin local storage : ${_sharedPreferences?.getBool(_Key.isOwner.toString())}');
  }

// ***************************************************************************
  /* Store and get the login state of user */

  bool get isLoggedIn {
    var res = _sharedPreferences?.getBool(_Key.isLoggedIn.toString());
    return res ?? false;
  }

  setIsLoggedIn(bool state) {
    _sharedPreferences?.setBool(_Key.isLoggedIn.toString(), state);
  }

// ***************************************************************************
/* Check the token status and store, get and remove the token   */

  String get token {
    var res = _sharedPreferences?.getString(_Key.token.toString());
    return res ?? "invalid";
  }

  setToken(String token) {
    _sharedPreferences?.setString(_Key.token.toString(), token);
  }

  removeToken() {
    _sharedPreferences?.remove(_Key.token.toString());

    log('Removed Token: ${_sharedPreferences?.getString(_Key.token.toString())}');
  }

// ***************************************************************************
  /* store the language store and get function */

  Locale get language {
    var languageCode = _sharedPreferences?.getString(kLanguageCode) ?? 'en';
    var conuntryCode =
        _sharedPreferences?.getString(kLanguageCountryCode) ?? '';
    Locale language = Locale(languageCode, conuntryCode);
    return language;
  }

  setLanguage(String languageCode, String countryCode) {
    _sharedPreferences?.setString(kLanguageCode, languageCode);
    _sharedPreferences?.setString(kLanguageCountryCode, countryCode);
  }

// ***************************************************************************
  /*  Store the theme of the app  */

  int get getThemMode {
    var res = _sharedPreferences?.getInt(kThemeMode);
    return res ?? ThemeMode.light.index;
  }

  setThemeMode(int themeMode) {
    _sharedPreferences?.setInt(kThemeMode, themeMode);
  }

// ***************************************************************************
  /* Store the login state of user Model*/
  OwnerDataModel? get userOwner {
    final rawJson = _sharedPreferences?.getString(_Key.userOwner.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return OwnerDataModel.fromJson(map);
  }

  setOwenrData(OwnerDataModel? userData) {
    if (userData != null) {
      _sharedPreferences?.setString(
          _Key.userOwner.toString(), json.encode(userData.toJson()));
      log('userowner :${userOwner!.agencyName}');
    } else {
      _sharedPreferences?.remove(_Key.userOwner.toString());
    }
  }

  DriverData? get userDriver {
    final rawJson = _sharedPreferences?.getString(_Key.userDriver.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return DriverData.fromMap(map);
  }

  setDriverData(DriverData? userData) {
    if (userData != null) {
      _sharedPreferences?.setString(_Key.userDriver.toString(), json.encode(userData.toMap()));
      log('userowner :${userDriver!.name}');
    } else {
      _sharedPreferences?.remove(_Key.userDriver.toString());
    }
  }

  DriverInfoModal? get userDriverProfile {
    final rawJson = _sharedPreferences?.getString(_Key.userDriverProfile.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return DriverInfoModal.fromMap(map);
  }

  setDriverProfileData(DriverInfoModal? userData) {
    if (userData != null) {
      _sharedPreferences?.setString(_Key.userDriverProfile.toString(), json.encode(userData.toMap()));
      log('userowner :${userDriverProfile!.fname}');
    } else {
      _sharedPreferences?.remove(_Key.userDriverProfile.toString());
    }
  }

  setTripId(int? tripId){
    if (tripId != null) {
      _sharedPreferences?.setInt(_Key.tripId.toString(), tripId!);
    } else {

    }
  }

  int get tripId {
    final tripId = _sharedPreferences?.getInt(_Key.tripId.toString());
    if (tripId == null) {
      return 0;
    }
    return tripId;
  }


// ***************************************************************************
}
