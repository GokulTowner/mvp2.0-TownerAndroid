// import 'package:townerapp/imports.dart';

// class CustomInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final text = newValue.text;

//     if (text.isEmpty) {
//       return newValue;
//     }

//     final StringBuffer formattedText = StringBuffer();
//     int offset = 0;

//     for (int i = 0; i < text.length; i++) {
//       if (i != 0 && i % 4 == 0) {
//         formattedText.write('-');
//         offset++;
//       }
//       formattedText.write(text[i]);
//     }

//     return TextEditingValue(
//       text: formattedText.toString(),
//       selection:
//           TextSelection.collapsed(offset: newValue.selection.end + offset),
//     );
//   }
// }