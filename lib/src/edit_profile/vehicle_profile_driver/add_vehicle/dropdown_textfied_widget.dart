import 'package:flutter/material.dart';

class DropdownTextField extends StatelessWidget {
  final List<dynamic> items;
  final String? hintText;
  final ValueChanged<String?> onChanged;

  const DropdownTextField({
    super.key,
    required this.items,
    required this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<String>(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 40,
              color: Colors.grey,
            ),
            isExpanded: true,
            hint: Text(
              hintText ?? 'Select an option',
              style: const TextStyle(color: Colors.grey),
            ),
            value: null,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 6),
          ),
        ],
      ),
    );
  }
}
