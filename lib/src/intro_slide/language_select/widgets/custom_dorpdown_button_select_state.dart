
import '../../../../imports.dart';
import '../../../../models/states_modal.dart';

class CustomDropdownButtonState extends StatelessWidget {
  const CustomDropdownButtonState({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<LanguageSelectProvider>(
      builder: (context, provider, child) {
        List<StateListModal> statesAndCities = provider.stateList!;
        return Container(
          height: height * 0.075,
          width: width * 0.94,
          decoration: BoxDecoration(
              color: cDropdownColor,
              borderRadius: BorderRadius.circular(rRadius_6)),
          child: Padding(
            padding:
                const EdgeInsets.only(right: pPadding_16, left: pPadding_16),
            child: Center(
              child: DropdownButton<StateListModal>(
                elevation: 5,
                isExpanded: true,
                value: provider.selectedUserState,
                onChanged: (value) {
                  provider.updateState(value);
                },
                borderRadius: BorderRadius.circular(rRadius_12),
                dropdownColor: cDropdownColor,
                hint: const Text(
                  hSelectState,
                  style: tsRegularTextWithColorGrey,
                ),
                underline: Container(
                  height: 0,
                  color: cTransparent,
                ),
                items: statesAndCities.map(
                  (state) {
                    return DropdownMenuItem<StateListModal>(
                      value: state,
                      child:
                          Text(state.name??'', style: tsRegularTextWithColorGrey),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
