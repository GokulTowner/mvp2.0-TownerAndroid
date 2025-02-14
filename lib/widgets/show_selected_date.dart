import 'package:intl/intl.dart';
import '../imports.dart';

Widget buildSelectedDateText(DateTime? startDate, DateTime? endDate,
    BuildContext context, dynamic provider,
    {String selectedOption = ''}) {
  final isDateRangeVisible = startDate != null &&
      endDate != null &&
      selectedOption != 'Ongoing' &&
      selectedOption != 'Scheduled';

  return isDateRangeVisible
      ? Padding(
          padding: pPaddingHorizontal_10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${'Selected date range'}: ${DateFormat('dd-MM-yyyy').format(startDate)} - ${DateFormat('dd-MM-yyyy').format(endDate)}',
                style: tsSmallTextBold,
              ),
              IconButton(
                onPressed: () {
                  provider.clearDateRange();
                },
                icon: const Icon(
                  Icons.cancel,
                ),
              ),
            ],
          ),
        )
      : const SizedBox();
}
