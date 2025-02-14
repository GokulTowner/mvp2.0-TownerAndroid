import 'dart:developer';
import '../../../../imports.dart';

class CreateInvoiceProvider extends ChangeNotifier {
  int _selectedOption = 0;
  bool _billingDetail = false;
  bool _container1state = false;
  bool _container2state = false;
  bool _container3state = false;

  bool _isAmountPaid = false;
  bool get isAmuntPaid => _isAmountPaid;

  int get selectedOption => _selectedOption;
  bool get isBillingDetail => _billingDetail;
  bool get isContainer1Expanded => _container1state;
  bool get isContainer2Expanded => _container2state;
  bool get isContainer3Expanded => _container3state;

  BookingInvoiceModel? _bookingInvoiceModel;
  BookingInvoiceModel? get bookingInvoiceModel => _bookingInvoiceModel;

  CreateInvoiceProvider({bool? isPaid}) {
    if (isPaid != null) {
      _isAmountPaid = isPaid;
      log('isAmtpaidPrvder : $_isAmountPaid');
      notifyListeners();
    }

    notifyListeners();
    fetchInvoiceBooking();
  }

  void setIsAmountPaid(bool isAmountPaid) {
    _isAmountPaid = isAmountPaid;
    log('isamount: $_isAmountPaid');
    notifyListeners();
  }

  void setSelectedOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }

  void toggleBillingDetail() {
    _billingDetail = !_billingDetail;
    _container1state = !_container1state;
    _container2state = !_container2state;
    _container3state = !_container3state;
    notifyListeners();
  }

  void toggleContainer1State() {
    _container1state = !_container1state;
    notifyListeners();
  }

  void toggleContainer2State() {
    _container2state = !_container2state;
    notifyListeners();
  }

  void toggleContainer3State() {
    _container3state = !_container3state;
    notifyListeners();
  }

  Future<void> fetchInvoiceBooking() async {
    BookingInvoiceService bookingInvoiceService = BookingInvoiceService();

    final result = await bookingInvoiceService.fetchInvoiceBooking();

    if (result != null) {
      _bookingInvoiceModel = result;
      log(_bookingInvoiceModel!.driverName.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }
}
