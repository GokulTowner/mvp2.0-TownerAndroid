import 'dart:developer';
import '../../../../imports.dart';

class ProfitAndLossService {
  Map<String, dynamic> data = {
    "totalEarnings": "1000",
    "totalExpenditure": "300"
  };

  String profitAndLossUrl = '';
  Dio dio = Dio();

  Future<ProfitAndLossModel?> fetchProfitAndLoss() async {
    try {
      // Response response = await dio.get(profitAndLossUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic prftLssData = data;

        ProfitAndLossModel profitAndLossData =
            ProfitAndLossModel.fromJson(prftLssData);
        return profitAndLossData;
      } else {
        return null;
      }
    } catch (e) {
      log("Error : $e");
      return null;
    }
  }
}
