import '../../../../imports.dart';

class AddMoneyProvider extends ChangeNotifier {
  AddMoneyService addMoneyService = AddMoneyService();
  final TextEditingController _addedAmount = TextEditingController();
  TextEditingController get addedAmount => _addedAmount;

  Future<void> addMoneyToWallet() async {
    final result =
        await addMoneyService.addMoneyWallet(int.parse(_addedAmount.text));
    if (result != null) {
      flutterToastSuccessShort(result['message'], 14);
    }
  }
}
