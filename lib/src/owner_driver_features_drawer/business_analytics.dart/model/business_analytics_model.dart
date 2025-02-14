class BusinessAnalyticsModel {
  final List<Trip> totalTrips;
  final List<PaymentType> pymntTypeOvrvw;
  final List<WorkingHours> totalWorkingHours;

  BusinessAnalyticsModel({
    required this.totalTrips,
    required this.pymntTypeOvrvw,
    required this.totalWorkingHours,
  });

  factory BusinessAnalyticsModel.fromJson(Map<String, dynamic> json) {
    return BusinessAnalyticsModel(
      totalTrips:
          (json['totalTrips'] as List).map((e) => Trip.fromJson(e)).toList(),
      pymntTypeOvrvw: (json['pymntTypeOvrvw'] as List)
          .map((e) => PaymentType.fromJson(e))
          .toList(),
      totalWorkingHours: (json['totalWorkingHours'] as List)
          .map((e) => WorkingHours.fromJson(e))
          .toList(),
    );
  }

  factory BusinessAnalyticsModel.defaultSettings() {
    return BusinessAnalyticsModel(
      totalTrips: [
        Trip(
          label: 'Accepted Trips',
          count: 2000,
          color: '#31b539',
          type: 'acceptedTrips',
        ),
        Trip(
          label: 'Rejected Trips',
          count: 800,
          color: '#ff0000',
          type: 'rejectedTrips',
        ),
      ],
      pymntTypeOvrvw: [
        PaymentType(
          label: 'Online',
          hours: 75,
          color: '#31b539',
          type: 'myWallet',
        ),
        PaymentType(
          label: 'Offline',
          hours: 20,
          color: '#ff0000',
          type: 'payCash',
        ),
        PaymentType(
          label: 'Offline',
          hours: 5,
          color: '#31b539',
          type: 'other',
        ),
      ],
      totalWorkingHours: [
        WorkingHours(
          label: 'Online',
          hours: 500,
          color: '#31b539',
          type: 'online',
        ),
        WorkingHours(
          label: 'Offline',
          hours: 200,
          color: '#ff0000',
          type: 'offline',
        ),
      ],
    );
  }
}

class Trip {
  final String label;
  final int count;
  final String color;
  final String type;

  Trip({
    required this.label,
    required this.count,
    required this.color,
    required this.type,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    var key = json.keys.first;
    var data = json[key];
    return Trip(
      label: data['label'],
      count: data['count'],
      color: data['color'],
      type: key,
    );
  }
}

class PaymentType {
  final String label;
  final int hours;
  final String color;
  final String type;

  PaymentType({
    required this.label,
    required this.hours,
    required this.color,
    required this.type,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    var key = json.keys.first;
    var data = json[key];
    return PaymentType(
      label: data['label'],
      hours: data['hours'],
      color: data['color'],
      type: key,
    );
  }
}

class WorkingHours {
  final String label;
  final int hours;
  final String color;
  final String type;

  WorkingHours({
    required this.label,
    required this.hours,
    required this.color,
    required this.type,
  });

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    var key = json.keys.first;
    var data = json[key];
    return WorkingHours(
      label: data['label'],
      hours: data['hours'],
      color: data['color'],
      type: key,
    );
  }
}
