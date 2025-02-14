import 'package:townerapp/models/country_modal.dart';

import '../../../../imports.dart';

class CustomDropdownButtonContry extends StatelessWidget {
  const CustomDropdownButtonContry({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<LanguageSelectProvider>(
      builder: (context, provider, child) {
        List<CountryModal> statesAndCities = provider.countryList!;
        return Container(
          height: height * 0.075,
          width: width * 0.94,
          decoration: BoxDecoration(
              color: cDropdownColor,
              borderRadius: BorderRadius.circular(rRadius_6),
              border: Border.all(color: cMainGreen)
          ),

          child: Padding(
            padding:
            const EdgeInsets.only(right: pPadding_16, left: pPadding_16),
            child: Center(
              child: DropdownButton<CountryModal>(
                elevation: 5,
                isExpanded: true,
                value: provider.selectedUserCountry,
                onChanged: (value) {
                  provider.updateCountry(value);
                },
                borderRadius: BorderRadius.circular(rRadius_12),
                dropdownColor: cDropdownColor,
                hint: const Text(
                  hSelectCountry,
                  style: tsRegularTextWithColorGrey,
                ),
                underline: Container(
                  height: 0,
                  color: cTransparent,
                ),

                items: statesAndCities.map((country) {
                    return DropdownMenuItem<CountryModal>(
                      value: country,
                      child:
                      Text(country.name??'', style: tsRegularTextWithColorGrey),
                    );
                  },
                ).toList(),
                menuMaxHeight: 200,
              ),
            ),
          ),
        );
      },
    );
  }
}
