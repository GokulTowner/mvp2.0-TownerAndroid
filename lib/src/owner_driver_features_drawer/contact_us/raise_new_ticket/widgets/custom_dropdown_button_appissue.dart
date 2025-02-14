import '../../../../../imports.dart';

class CustomDropdownButtonAppIssue extends StatelessWidget {
  const CustomDropdownButtonAppIssue({super.key});

  @override
  Widget build(BuildContext context) {
    final raiseNewTicketProvider = context.watch<RaiseNewTicketProvider>();
    final raiseNewTicketProviderWatch =
        Provider.of<RaiseNewTicketProvider>(context, listen: false);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.075,
      width: width * 0.94,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: Center(
          child: DropdownButton<String>(
            elevation: 5,
            isExpanded: true,
            hint: Text(AppLocalizations.of(context)!.selectAnIssue),
            value: raiseNewTicketProviderWatch.appIssue,
            onChanged: (value) {
              raiseNewTicketProvider.updateAppIssue(value);
            },
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xFFEEEEEE),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            items: const [
              DropdownMenuItem(
                value: 'Report Issue',
                child: Text(
                  'Report Issue',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Incentive Issue',
                child: Text(
                  'Incentive Issue',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Refferral Issue',
                child: Text(
                  'Refferral Issue',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Trip Issue',
                child: Text(
                  'Trip Issue',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA8A8A8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
