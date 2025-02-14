import '../imports.dart';

class CustomDropdown1 extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String> onChanged;
  final String hint;
  final bool isDropdownOpen;
  final Function setIsDropdownOpen;

  // final dynamic setDropdownValue;

  const CustomDropdown1({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
    required this.hint,
    required this.isDropdownOpen,
    required this.setIsDropdownOpen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setIsDropdownOpen();
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedOption ?? hint,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFFA8A8A8),
                      ),
                    ),
                  ),
                  Icon(
                    isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xFFA8A8A8),
                    size: 30,
                  ),
                ],
              ),
            ),
            if (isDropdownOpen)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isDropdownOpen ? options.length * 40.0 : 0,
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = options[index];
                    return GestureDetector(
                      onTap: () {
                        onChanged(option);
                        setIsDropdownOpen();
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
