import '../imports.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String> onChanged;
  final String hint;

  const CustomDropdown({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.hint,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDropdownOpen = !_isDropdownOpen;
        });
      },
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.selectedOption ?? widget.hint,
                        style: TextStyle(
                          fontSize: 17,
                          color: cTextGrey,
                        ),
                      ),
                    ),
                    Icon(
                      _isDropdownOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: cTextGrey,
                      size: 30,
                    ),
                  ],
                ),
              ),
              if (_isDropdownOpen)
                SizedBox(
                  height: widget.options.length * 50.0,
                  child: Column(
                    children: widget.options.map((option) {
                      return GestureDetector(
                        onTap: () {
                          widget.onChanged(option);
                          setState(() {
                            _isDropdownOpen = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 17,
                              color: cTextGrey,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
