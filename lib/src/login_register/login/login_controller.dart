// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:townerapp/models/driver_info_modal.dart';
import 'package:townerapp/models/driver_login_modal.dart';

import '../../../imports.dart';
import '../../../network/driver_repo.dart';

class LoginProvider extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();
  LoginService loginService = LoginService();

  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _showPass = true;
  bool _isOwner = false;

  OwnerDataModel? _ownerData;
  OwnerDataModel? get owenrData => _ownerData;

  DriverData? _driverData;
  DriverData? get driverData => _driverData;

  DriverInfoModal? _driverInfoModal;
  DriverInfoModal? get driverInfoModal => _driverInfoModal;

  TextEditingController get mobile => _mobile;
  TextEditingController get password => _password;

  bool get showPass => _showPass;
  bool get isOwner => _isOwner;

  Map<String, dynamic> deviceInfo = {};

  setDeviceIfo(Map<String, dynamic> deviceInfo) async {
    deviceInfo = deviceInfo;
  }

  setShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  setIsOwnerTrue() {
    _isOwner = true;
    log('Is Owner : $_isOwner');
    localStorageService.init();
    localStorageService.setisOwner(true);
    log('Is owner : ${localStorageService.isowner.toString()}');
  }

  setIsOwnerFalse() async {
    _isOwner = false;
    await localStorageService.setisOwner(false);

    log('Is owner : ${localStorageService.isowner.toString()}');
  }

  String? mobileValidation(String? value, {BuildContext? context}) {
    // Validate if the value is empty
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context!)!.enterYourMobileNumber;
    } else if (value.length < 10) {
      return "Enter valid mobile number"; /*AppLocalizations.of(context!)!.enterValidMobileNumber;*/
    }

    return null;
  }

  String? passwordValidation(String? value, BuildContext context) {
    // Validate if the value is empty
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.pleaseenterPassword;
    }

    return null;
  }

  void afterValidation(BuildContext context) {
    if (_isOwner == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingScreenOwner(isOwner: true),
        ),
      );
    } else {
      Navigator.pushNamed(context, RouteClass.landingScreenOwner);
    }
  }

  getOwnerDataFromSharedPref() async {
    await localStorageService.init();
    _ownerData = localStorageService.userOwner;
    log('Owner data : ${_ownerData!.agencyName}');
    notifyListeners();
  }

  getDriverDataFromSharedPref() async {
    await localStorageService.init();
    _driverData = localStorageService.userDriver;
    log('Owner data : ${_driverData!.name}');
    notifyListeners();
  }

  Future<void> loginRequest(BuildContext context) async {
    var map = {
      "username":"",
      "phcode": "+91",
      "email": _mobile.text,
      "loginType": "normal",
      "loginId": "",
      "fcmId": "",
      "password":password.text
    };

    final result =  await DriverRepo.login(map);
    if(result is Exception){
      flutterToastFailLong(
          AppLocalizations.of(context)!.youHaveEnteredWrongUsernameOrPassword,
          14);
      return;
    }

    if (result != null && result['success']) {
      log('result token ${result['token'].toString()}');
      await localStorageService.init();
      await localStorageService.setToken(result['token']);
      String? token = localStorageService.token;
      log('message ${token.toString()}');

      if (_isOwner == true) {
        _ownerData = OwnerDataModel.fromJson(result['userData']);
        await localStorageService.setOwenrData(_ownerData);
        _ownerData = localStorageService.userOwner;
        notifyListeners();
      } else {
        var driver = driverLoginModalFromMap(jsonEncode(result));
        _driverData = driver.datas!.first;
        await localStorageService.setDriverData(_driverData);
        _driverData = localStorageService.userDriver;
        notifyListeners();
        log('Driver Data : ${result['data'].toString()}');
      }
      String fbCustomToken = result["FbCusToken"];


      setupFirebaseLogin(fbCustomToken);


      flutterToastSuccessLong(
          AppLocalizations.of(context)!.loginSuccessfull, 14);

      _isOwner == true
          ? Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.landingScreenOwner, (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
          context, RouteClass.landingScreenDriver, (route) => false);
    }else{
      flutterToastFailLong(
          AppLocalizations.of(context)!.youHaveEnteredWrongUsernameOrPassword,
          14);
    }

  }

  Future<void> getDriverInfo(BuildContext context) async {


    final result =  await DriverRepo.getProfile(null);
    if(result is Exception){
      flutterToastFailLong(
          AppLocalizations.of(context)!.youHaveEnteredWrongUsernameOrPassword,
          14);
      return;
    }

    if (result != null) {
      DriverInfoModal? data = driverInfoModalFromMap(jsonEncode(result)).firstOrNull;
      if(data!=null){
        _driverInfoModal = data;
        localStorageService.setDriverProfileData(_driverInfoModal);
      }
      notifyListeners();
    }else{
      flutterToastFailLong(
          AppLocalizations.of(context)!.youHaveEnteredWrongUsernameOrPassword,
          14);
    }

  }

  Future<void> setupFirebaseLogin(String fbCustomToken) async {


    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCustomToken(fbCustomToken);

      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;

        if(userCredential.user!=null){
          var userId = userCredential.user?.uid;
          print("user id check :- $userId");
          if(userId!=null){

            print("user id :- $userId");
            3.seconds.delay((){
              try {

                ref.child("drivers_data").child(userId).child("FCM_id").set(token);
              } on Exception catch (e) {
                e.printError();
              }
            });

          }
          else{
            print("User id is null");
          }
        }
      });

    } catch (e) {
      print("Error signing in with custom token: $e");
    }

  }
}
