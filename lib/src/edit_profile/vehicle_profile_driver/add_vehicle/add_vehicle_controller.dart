import 'dart:convert';

import 'package:get/get.dart';
import 'package:townerapp/network/driver_repo.dart';
import '../../../../imports.dart';
import '../model/car_make_modal.dart';
import '../model/vehicle_common_modal.dart';

class CreateVehicleProvider extends ChangeNotifier {

/*  CreateVehicleProvider(){
    init();
  }*/

  void init() {
    getCommonData();
    getCars();
  }

  final TextEditingController _licence = TextEditingController();
  TextEditingController get licence => _licence;

  List<VehicleCommonModal>? _commonList;
  List<VehicleCommonModal>? get commonList => _commonList;

  final _typeList = <String>["SUV", "Hatchback", "Sedan" , "Auto"];

  List<String> get typeList => _typeList;


  List<CarMakeModal>? _cars;
  List<CarMakeModal>? get cars => _cars;

  CarData? _selectedCarMake;
  CarData? get selectedCarMake => _selectedCarMake;

  String? _selectedCarModal;
  String? get selectedCarModal => _selectedCarModal;

  VehicleCommon? _selectedYear;
  VehicleCommon? get selectedYear => _selectedYear;

  VehicleCommon? _selectedColor;
  VehicleCommon? get selectedColor => _selectedColor;


  String? _selectedType;
  String? get selectedType => _selectedType;

  setCarData(CarData? data){
    if(data==null)return;
    _selectedCarModal = null;

    _selectedCarMake = data;
    notifyListeners();
  }

  setCarModal(String? data){
    if(data==null)return;

    _selectedCarModal = data;
    notifyListeners();
  }

  setYear(VehicleCommon? data){
    if(data==null)return;

    _selectedYear = data;
    notifyListeners();
  }

  setColor(VehicleCommon? data){
    if(data==null)return;

    _selectedColor = data;
    notifyListeners();
  }

  setTyper(String? data){
    if(data==null)return;

    _selectedType = data;
    notifyListeners();
  }

  getCarMake(){
    return cars?.firstOrNull?.datas;
  }

  getCarModal(){
    if(selectedCarMake==null) return <String>[];

    return selectedCarMake?.model;
  }
  getCarModalYear(){
    return commonList?[2].datas;
  }

  getCarColor(){
    return commonList?[3].datas;
  }

  Future<void> getCommonData() async {
    final result =  await DriverRepo.carCommonData(null);

    if (result != null) {
      _commonList = vehicleCommonModalFromMap(jsonEncode(result));
      notifyListeners();
    }else{
      _commonList = List.empty(growable: true);
    }
  }

  Future<void> getCars() async {
    final result =  await DriverRepo.carMake(null);

    if (result != null) {
      _cars  = carMakeModalFromMap(jsonEncode(result));
      notifyListeners();

    }else{
      _cars = List.empty(growable: true);
    }
  }


  Future<void> createVehicle(BuildContext context) async {

    try {

      if(licence.text.isEmpty){
        Fluttertoast.showToast(
          msg: 'Licence cannot be empty',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      if(selectedType.isNullOrBlank??true){
        Fluttertoast.showToast(
          msg: 'Please select vehicle type',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      if(selectedCarMake.isNullOrBlank??true){
        Fluttertoast.showToast(
          msg: 'Please select vehicle make',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      if(selectedCarModal.isNullOrBlank??true){
        Fluttertoast.showToast(
          msg: 'Please select vehicle modal',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      if(selectedYear.isNullOrBlank??true){
        Fluttertoast.showToast(
          msg: 'Please select vehicle year',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }
      if(selectedColor.isNullOrBlank??true){
        Fluttertoast.showToast(
          msg: 'Please select vehicle color',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return;
      }


      var map = {
        "driverName": localStorageService.userDriver?.name??'',
        "driver": localStorageService.userDriver?.userId??'',
        "cpy": "null",
        "licence": licence.text,
        "make": selectedCarMake?.id,
        "makename": selectedCarMake?.make,
        "model": selectedCarModal,
        "vehicletype": selectedType,
        "color": selectedColor?.name,
        "year": selectedYear?.name,
        "image": ""
      };

      final result =  await DriverRepo.createTaxi(map);

      if (result != null && result["success"]) {
        Get.back(result: true);
      }else{
        Fluttertoast.showToast(
          msg: result["success"]??'Something went wrong',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }
    } on Exception catch (e) {
      e.printError();
    }
  }


}
