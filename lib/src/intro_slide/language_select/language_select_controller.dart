import 'dart:developer';
import 'package:get/get.dart';
import 'package:townerapp/models/city_list_modal.dart';
import 'package:townerapp/models/country_modal.dart';
import 'package:townerapp/models/states_modal.dart';

import '../../../imports.dart';
import '../../../network/driver_repo.dart';

class LanguageSelectProvider extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();
  LanguageSelectProvider() {
    getCountry();
  }

  List<CountryModal> _countryList = List.empty(growable: true);
  List<CountryModal>? get countryList => _countryList;


  List<StateListModal> _stateList = List.empty(growable: true);
  List<StateListModal>? get stateList => _stateList;


  List<CityListModal> _cities = List.empty(growable: true);
  List<CityListModal>? get cities => _cities;

  CountryModal? _selectedUserCountry;
  CountryModal? get selectedUserCountry => _selectedUserCountry;


  StateListModal? _selectedUserState;
  StateListModal? get selectedUserState => _selectedUserState;

  CityListModal? _selectedUserCity;
  CityListModal? get selectedUserCity => _selectedUserCity;

  Future<void> updateState(StateListModal? selectedState) async {
    if (selectedState == null) return;
    _selectedUserCity = null;

    _selectedUserState = selectedState;
    log("states : ${_stateList.length}");

    getCity(selectedState.createUserSuccessModalId!);
    notifyListeners();
  }

  Future<void> updateCountry(CountryModal? userCountry) async {
    if (userCountry == null) return;
    _selectedUserCity = null;
    _selectedUserCountry = userCountry;
    getStates();
    notifyListeners();
  }

  Future<void> updateCity(CityListModal? newCity) async {
    if (newCity == null) return;
    log("selected city : $newCity");
    _selectedUserCity = newCity;
    notifyListeners();
  }

  Future<void> getStatesAndCities() async {


    /*final result =  await DriverRepo.getCountry(null);

    if (result != null) {
      _stateList = countryModalFromMap(jsonEncode(result));
      notifyListeners();
    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }*/

  }

  Future<void> getCountry() async {


    final result =  await DriverRepo.getCountry(null);

    if (result != null) {
      _countryList = countryModalFromMap(jsonEncode(result));
      notifyListeners();
    }else{
      if(result["message"]!=null){
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }

  }

  Future<void> setIsFirst() async {
    localStorageService.setfirstTime(true);
  }


  void getStates() async{

    try {
      final result =  await DriverRepo.getStates(null);

      if (result != null) {
        _stateList = convertStateModalModalFromMap(jsonEncode(result));
        notifyListeners();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      e.printError();
    }

  }

  void getCity(String stateId) async{

    try {
      final result =  await DriverRepo.getCity(stateId);

      if (result != null) {
        _cities = cityListModalFromMap(jsonEncode(result));
        notifyListeners();
      }else{
        if(result["message"]!=null){
          Fluttertoast.showToast(msg: '${result['message']}');
        }
      }
    } on Exception catch (e) {
      e.printError();
    }

  }
}
