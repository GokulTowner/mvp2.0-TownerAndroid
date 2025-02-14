import 'package:flutter_test/flutter_test.dart';
import 'package:townerapp/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late DriverProfileProvider driverProfileProvider;

  setUp(() {
    driverProfileProvider = DriverProfileProvider();
  });
  group(
    'driver profile controller ...',
    () {
      group(
        'Fetch driver profile function + ve test case',
        () {
          test(
            'Given Driver profiele controller when function call value of driverprofileList should be a list of profile model',
            () async {
              //arrange

              //act
              final value = driverProfileProvider.driverProfileList;
              await driverProfileProvider.fetchDriverProfileList();
              //assert
              expect(value, isA<List<DriverProfileModel>>());
            },
          );
        },
      );
      group('Given driver profiel function -ve test case', () {
        test(
            'Given driver profile controller when function call value should be null',
            () {
          //arrange

          //act

          //assert
        });
      });
    },
  );
}
