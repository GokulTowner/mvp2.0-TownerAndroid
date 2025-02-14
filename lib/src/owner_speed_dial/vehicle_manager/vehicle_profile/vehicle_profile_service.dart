import 'dart:developer';
import '../../../../imports.dart';

final List<Map<String, dynamic>> vehicleDetaisListsample = [
  {
    "vehicleId": "veh001",
    "vehicleRegNo": "KA-20-B-2345",
    "vehicleType": "Sedan",
    "vehicleCompany": "Honda",
    "vehicleModel": "Honda City",
    "seatingCapacity": "4",
    "yearModel": "4-2020",
    "vehicleColor": "White",
    "serviceType": "Daily",
    "fuelType": "Petrol",
    "vehicleCategory": "Passenger",
    "vehImage":
        "https://spn-sta.spinny.com/blog/20220228142128/Spinny-Assured-Honda-City.jpg?compress=true&quality=80&w=576&dpr=2.6",
    "docStatus": "Approved",
    "vehPhotos": {"front": "", "back": "", "driver": "", "coDriver": ""},
    "vehRc": {
      "status": true,
      "rto": "KA-20",
      "vehicleNo": "KA-20-B-2345",
      "rcNumber": "KU98439898",
      "expDate": "22-6-2025",
      "rcImage": ""
    },
    "vehInshurance": {
      "status": true,
      "inshProvider": "ICICI Auto",
      "vehicleNo": "KA-20-B-2345",
      "policyNumber": "KU98439898",
      "expDate": "22-6-2025",
      "inshImage": ""
    },
    "vehPermit": {
      "status": true,
      "permitType": "KA-20",
      "vehicleNo": "KA-20-B-2345",
      "permitNumber": "KU98439898",
      "expDate": "22-6-2025",
      "policyImage": ""
    },
    "vehTax": {
      "status": true,
      "rtoType": "RTO bangalore",
      "vehicleNo": "KA-20-B-2345",
      "taxNumber": "KU98439898",
      "expDate": "22-6-2025",
      "taxImage": ""
    },
    "vehEmissoin": {
      "status": true,
      "emissionType": "type 1",
      "vehicleNo": "KA-20-B-2345",
      "emissionNumber": "KU98439898",
      "expDate": "22-6-2025",
      "emissionImage": ""
    },
    "vehFitness": {
      "status": true,
      "emissionType": "type 1",
      "vehicleNo": "KA-20-B-2345",
      "emissionNumber": "KU98439898",
      "expDate": "22-6-2025",
      "emissionImage": ""
    },
  },
];

class VehicleProfileService {
  final List<Map<String, dynamic>> _vehicleDetaisList = [
    {
      "vehicleId": "veh001",
      "vehImage":
          "https://spn-sta.spinny.com/blog/20220228142128/Spinny-Assured-Honda-City.jpg?compress=true&quality=80&w=576&dpr=2.6",
      "vehicleType": "Sedan",
      "model": "Honda City",
      "driver": "",
      "rc": "KA-51-1234",
      "docStatus": "Approved"
    },
    {
      "vehicleId": "veh002",
      "vehImage":
          "https://imagecdnsa.zigwheels.ae/large/gallery/color/40/416/toyota-yaris-sedan-color-273110.jpg",
      "vehicleType": "Sedan",
      "model": "Toyota Yaris",
      "driver": "David",
      "rc": "MH-02-5678",
      "docStatus": "Approved"
    },
    {
      "vehicleId": "veh003",
      "vehImage":
          "https://www.motortrend.com/uploads/sites/10/2019/12/2020-ford-ecosport-se-suv-angular-front.png",
      "vehicleType": "SUV",
      "model": "Ford EcoSport",
      "driver": "",
      "rc": "TN-07-9012",
      "docStatus": "Rejected"
    },
    {
      "vehicleId": "veh004",
      "vehImage":
          "https://upload.wikimedia.org/wikipedia/commons/f/f0/2011_Volkswagen_Polo_S_60_1.2_Front.jpg",
      "vehicleType": "Hatchback",
      "model": "Volkswagen Polo",
      "driver": "",
      "rc": "GJ-03-2468",
      "docStatus": "Pending"
    },
    {
      "vehicleId": "veh005",
      "vehImage":
          "https://imgd-ct.aeplcdn.com/664x415/n/cw/ec/25107/compass-exterior-left-front-three-quarter-3.jpeg?q=80",
      "vehicleType": "SUV",
      "model": "Jeep Compass",
      "driver": "",
      "rc": "KL-13-1357",
      "docStatus": "Verifying"
    },
    {
      "vehicleId": "veh006",
      "vehImage":
          "https://www.team-bhp.com/sites/default/files/styles/check_extra_large_for_review/public/2_53.jpeg",
      "vehicleType": "Sedan",
      "model": "Maruti Suzuki Ciaz",
      "driver": "",
      "rc": "MP-20-8020",
      "docStatus": "Pending"
    },
    {
      "vehicleId": "veh007",
      "vehImage":
          "https://stat.overdrive.in/wp-content/odgallery/2022/03/61583_2022_Renault_Kwid_468x263.jpg",
      "vehicleType": "Hatchback",
      "model": "Renault Kwid",
      "driver": "",
      "rc": "RJ-14-4682",
      "docStatus": "Verifying"
    },
    {
      "vehicleId": "veh008",
      "vehImage":
          "https://images.hindustantimes.com/auto/img/2022/06/30/600x338/Kia_Seltos_facelift_1656581787161_1656581793553.jpg",
      "vehicleType": "SUV",
      "model": "Kia Seltos",
      "driver": "",
      "rc": "PB-10-3690",
      "docStatus": "Approved"
    }
  ];

  Dio dio = Dio();
  String vehiclListUrl = '';

  Future<List<VehicleDetailsModel>?> fetchVehicleList() async {
    try {
      // Response response = await dio.get(vehiclListUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        List<dynamic> jsonData = _vehicleDetaisList;

        List<VehicleDetailsModel> vehicleList = jsonData
            .map((vehicleDetails) =>
                VehicleDetailsModel.fromJson(vehicleDetails))
            .toList();
        return vehicleList;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
    return null;
  }
}
