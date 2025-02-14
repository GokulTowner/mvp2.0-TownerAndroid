import '../../../../imports.dart';

class WalletProvider extends ChangeNotifier {
  WalletProvider() {
    fetchWallet();
  }
  WalletService walletService = WalletService();

  WalletModel walletModel =
      WalletModel(id: '', totalAmount: '', currency: '', history: []);

  Future<void> fetchWallet() async {
    final result = await walletService.fetchWalletDetails();
    if (result != null) {
      walletModel = result;
      notifyListeners();
    }
  }
}
