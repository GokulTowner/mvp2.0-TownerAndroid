class LanguageSelectStateCityModel {
  final List<StateModel> states;

  LanguageSelectStateCityModel({
    required this.states,
  });

  factory LanguageSelectStateCityModel.fromJson(Map<String, dynamic> json) {
    var statesList = json['states'] as List;
    List<StateModel> states =
        statesList.map((stateJson) => StateModel.fromJson(stateJson)).toList();
    return LanguageSelectStateCityModel(states: states);
  }

  Map<String, dynamic> toJson() {
    return {
      'states': states.map((state) => state.toJson()).toList(),
    };
  }
}

class StateModel {
  final String name;
  final List<String> cities;

  StateModel({
    required this.name,
    required this.cities,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'],
      cities: List<String>.from(json['cities']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cities': cities.toList(),
    };
  }
}
