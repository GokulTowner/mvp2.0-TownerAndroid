// import 'package:townerapp/imports.dart';

// class CreateDriverAccountPopupProvider extends ChangeNotifier{
// // late CountdownTimer _countdownTimer;
//   late String _formattedTime;




//   void _startTimer() {
//     _countdownTimer.listen((event) {
//       setState(() {
//         _formattedTime = _formatTime(event.remaining);
//       });
//     });
//   }

//   void _navigateToNextPage() {
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => EditProfilePage()),
//       );
//     });
//   }

//   String _formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final String hours = twoDigits(duration.inHours.remainder(24));
//     final String minutes = twoDigits(duration.inMinutes.remainder(60));
//     final String seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$hours:$minutes:$seconds';
//   }
// }