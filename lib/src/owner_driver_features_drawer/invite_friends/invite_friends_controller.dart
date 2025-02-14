import '../../../imports.dart';

class InviteFriendsProvider extends ChangeNotifier {
  Future<void> shareFunction(String referralCode) async {
    String text =
        'Thank you for sharing Towner. Your referral code is: $referralCode \nDownload Towner app now: https://play.google.com/store/apps/details?id=com.towner.app';
    await FlutterShare.share(
      title: 'Share via',
      text: text,
      chooserTitle: 'Share via',
    );
  }
}
