import '../../../../imports.dart';
import '../../../../models/city_list_modal.dart';

class CustomDropdownButtonCity extends StatelessWidget {
  const CustomDropdownButtonCity({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<LanguageSelectProvider>(
      builder: (context, provider, child) {
        return Container(
          height: height * 0.075,
          width: width * 0.94,
          decoration: BoxDecoration(
              color: cDropdownColor, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding:
                const EdgeInsets.only(right: pPadding_16, left: pPadding_16),
            child: Center(
              child: DropdownButton<CityListModal>(
                  elevation: 5,
                  isExpanded: true,
                  value: provider.selectedUserCity,
                  onChanged: (CityListModal? value) {
                    provider.updateCity(value);
                  },
                  hint: const Text(
                    hSelectCity,
                    style: tsRegularTextWithColorGrey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: cDropdownColor,
                  underline: Container(
                    height: 0,
                    color: cTransparent,
                  ),
                  items: provider.cities?.map(
                    (city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city.name??'', style: tsRegularTextWithColorGrey),
                      );
                    },
                  ).toList()),
            ),
          ),
        );
      },
    );
  }
}
