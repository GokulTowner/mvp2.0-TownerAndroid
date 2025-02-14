import 'dart:developer';

import '../../../../imports.dart';

class ContactUsController extends ChangeNotifier {
  BuildContext? context;
  ContactUsController(BuildContext context) {
    context = context;
  }
  final List<LogoItem> logoItems = [
    LogoItem(
      boldText: 'Email',
      imagePath: imgEmailLogo,
    ),
    LogoItem(
      boldText: 'Website',
      imagePath: imgWebsiteLogo,
    ),
    LogoItem(
      boldText: 'WhatsApp',
      imagePath: imgWhastappLogo,
    ),
    LogoItem(
      boldText: 'Call Us',
      imagePath: imgCallUsLogo,
    ),
    LogoItem(
      boldText: 'Text',
      imagePath: imgTextLogo,
    ),
    LogoItem(
      boldText: 'Ticket Status',
      imagePath: imgTicketlogo,
    ),
  ];

  final String websiteUrl = 'https://towner.taxi/';
  final String _phoneNumber = '+919364102995';
  final String _mobileNumber = '+919364102995';
  final Uri _whatsappNumber = Uri.parse('https://wa.me/+919364102995');

  Future<void> sendFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@townertaxi.app',
      queryParameters: {'subject': 'Feedback'},
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      log('Error launching email: $e');
    }
  }

  void launchWebsiteURL() async {
    final Uri websiteUri = Uri.parse(websiteUrl);
    if (await canLaunchUrl(websiteUri)) {
      await launchUrl(websiteUri);
    } else {
      throw 'Could not launch $websiteUrl';
    }
  }

  Future<void> whatsappUrl() async {
    if (await canLaunchUrl(_whatsappNumber)) {
      await launchUrl(_whatsappNumber);
    }
  }

  Future<void> textMessage() async {
    final Uri smsUri = Uri(scheme: 'sms', path: _phoneNumber);

    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    }
  }

  Future<void> callFunction() async {
    final Uri callUri = Uri(scheme: 'tel', path: _mobileNumber);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    }
  }
}
