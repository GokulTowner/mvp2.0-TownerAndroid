import '../../../../../imports.dart';

class VehiclePercentageWidget extends StatelessWidget {
  final bool? readOnlyPerc;
  final TextEditingController percentage;
  const VehiclePercentageWidget(
      {this.readOnlyPerc, required this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleSettingsProvider>(
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
                      text: "Percentage",
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

              // 2nd row

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Set Value'),
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
