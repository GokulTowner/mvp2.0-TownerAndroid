import '../../../../../imports.dart';

class DriverRadioButtonWidget extends StatelessWidget {
  final bool? readOnlyPerc;
  final bool? readOnlyAmt;
  final TextEditingController percentage;
  final TextEditingController amount;
  const DriverRadioButtonWidget(
      {required this.amount,
      required this.percentage,
      this.readOnlyAmt,
      this.readOnlyPerc,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer<DriverSettingsProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextWidget(
                      text: AppLocalizations.of(context)!.percentage,
                      size: 16.0,
                      color: cTextGrey,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 69,
                    height: 43,
                    child: TextFormField(
                      readOnly: readOnlyPerc ?? false,
                      controller: percentage,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              sizedBoxHeight15,
              // 2nd row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomTextWidget(
                      text: AppLocalizations.of(context)!.amount,
                      size: 16.0,
                      color: cTextGrey,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 69,
                    height: 43,
                    child: TextFormField(
                      readOnly: readOnlyAmt ?? false,
                      controller: amount,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       onPressed: () {},
              //       child: const Text('Set Value'),
              //     ),
              //   ],
              // ),
            ],
          );
        },
      ),
    );
  }
}
