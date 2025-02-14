import '../imports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hint;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool? readOnly;
  final Function(String)? onChanged;

  const CustomTextFormField({
    required this.textEditingController,
    required this.isPass,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.validator,
    this.maxLength,
    this.onChanged,
    this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly,
      //   LengthLimitingTextInputFormatter(12),
      //   CustomInputFormatter()
      // ],
      readOnly: readOnly ?? false,
      autofocus: false,
      onChanged: onChanged,
      maxLength: maxLength,
      validator: validator,
      keyboardType: textInputType,
      controller: textEditingController,
      obscureText: isPass,
      decoration: InputDecoration(
        label: Text(hint),
        labelStyle: const TextStyle(
          color: Color(0xFFA8A8A8),
        ),
        filled: true,
        fillColor: const Color(0xFFEEEEEE), // Set the background color to grey
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFFA8A8A8),
        ), // Set the hint text color to grey
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: cMainGreen),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: cMainGreen),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: cMainGreen,
          ), // Set the color for the focused border
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      ),
      style: TextStyle(
        color: cDarkBlack, // Set the entered text color to grey
      ),
    );
  }
}
