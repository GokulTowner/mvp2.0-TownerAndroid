import '../../../../imports.dart';

class AddNewExpenditureService {
  List<String> expenditureList = [
    "Fuel Coasts",
    "Maintanance and Repairs",
    "Insurance",
    "Licensing And Permits",
    "Vehicle Cleaning",
    "Miscellaneous"
  ];

  Dio dio = Dio();
  String getExpenditureOptionUrl = "";
  Future<List<String>?> fetchGetExpenditureOptions() async {
    try {
      // Response response = await dio.get(getExpenditureOptionUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        List<String> data = expenditureList;

        return data;
      }
    } catch (e) {
      throw Exception('An Error occured $e');
    }
    return null;
  }
}
