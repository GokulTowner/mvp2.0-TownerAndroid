import '../../../imports.dart';

class LanguageSelectService {
  dynamic listOfStates = {
    "states": [
      {
        "name": "Kerala",
        "cities": ["Cochin", "Kozhikkode", "Kannur", "Trivandrum"]
      },
      {
        "name": "Tamil Nadu",
        "cities": ["Chinni", "Koambatore"]
      },
      {
        "name": "Karnataka",
        "cities": ["Bangalore", "Mysore", "Hubli"]
      },
      {
        "name": "Maharashtra",
        "cities": ["Mumbai", "Pune", "Nagpur"]
      },
      {
        "name": "Telangana",
        "cities": ["Hyderabad", "Warangal", "Karimnagar"]
      },
      {
        "name": "Goa",
        "cities": ["Panaji", "Vasco da Gama", "Mapusa"]
      },
      {
        "name": "Delhi",
        "cities": ["New Delhi", "Gurgaon", "Noida"]
      }
    ]
  };

  Dio dio = Dio();

  String statesAndCitiesUrl = '';

  Future<LanguageSelectStateCityModel?> fetchStatesAndCities() async {
    try {
      // Response response = await dio.get(statesAndCitiesUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic statesAndCity = listOfStates;
        LanguageSelectStateCityModel model =
            LanguageSelectStateCityModel.fromJson(statesAndCity);
        return model;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
