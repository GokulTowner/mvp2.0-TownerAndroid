import '../../../imports.dart';

class BusinessProfileProvider extends ChangeNotifier {
  File? _leasedAgreement;
  File? get leasedAgreement => _leasedAgreement;

  File? _leasedAgreementPdf;
  File? get leasedAgreementPdf => _leasedAgreementPdf;

  File? _ownerPhoto;
  File? get ownerPhoto => _ownerPhoto;

  File? _businessLogo;
  File? get businessLogo => _businessLogo;
}
