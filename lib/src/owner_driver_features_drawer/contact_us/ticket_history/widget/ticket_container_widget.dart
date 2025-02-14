import '../../../../../imports.dart';

class TicketContainer extends StatelessWidget {
  final String? ticketId;
  final String? date;
  final String? time;
  final bool? isPending;
  final String? remarks;
  final String? issueCategory;

  const TicketContainer({
    super.key,
    this.ticketId,
    this.date,
    this.time,
    this.isPending,
    this.remarks,
    this.issueCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pPagePadding_10,
      decoration: BoxDecoration(
        color: const Color(0xFFf1f2f6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ticket ID',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                ticketId!,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          sizedBoxHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Date & time',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$time PM',
                    style: TextStyle(color: cTextDarkGrey),
                  )
                ],
              ),
            ],
          ),
          sizedBoxHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              isPending!
                  ? const Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
          sizedBoxHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Issue Category',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                issueCategory!,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          sizedBoxHeight15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Remarks',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                remarks!,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          sizedBoxHeight15,
        ],
      ),
    );
  }
}
