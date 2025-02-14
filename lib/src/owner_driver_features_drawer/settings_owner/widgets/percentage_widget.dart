import 'dart:developer';
import '../../../../imports.dart';

class PercentageWidget extends StatelessWidget {
  final bool? readOnlyPerc;
  final TextEditingController percentage;
  const PercentageWidget(
      {this.readOnlyPerc, required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OwnerSettingsProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: pPaddingHorizontal_12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextWidget(
                      text:
                          "${AppLocalizations.of(context)!.percentage} (CGST | SGST | IGST)",
                      size: 15.0,
                      color: cTextGrey,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 60,
                    child: TextFormField(
                      onTap: () {
                        log('message');
                        provider.setGstReadOnly(false);
                      },
                      readOnly: readOnlyPerc ?? false,
                      controller: percentage,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '%',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              sizedBoxHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      provider.setGstReadOnly(true);
                    },
                    child: Text(AppLocalizations.of(context)!.setValue),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
