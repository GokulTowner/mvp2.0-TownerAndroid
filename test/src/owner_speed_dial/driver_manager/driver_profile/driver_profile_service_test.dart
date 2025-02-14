import 'package:flutter_test/flutter_test.dart';
import 'package:townerapp/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late DriverProfileService driverProfileService;

  setUp(() {
    driverProfileService = DriverProfileService();
  });
  group(
    'driver profile service ...',
    () {
      group(
        'Driver profile fetch function',
        () {
          test(
            'Given driver profile service class when gerDriverDetails function is called and status code 200 then Driver profile model should be return',
            () async {
              //Arrange
              //Act
              final driverDetails =
                  await driverProfileService.getDriverDetails();

              //Assert
              expect(driverDetails, isA<List<DriverProfileModel>>());
            },
          );
        },
      );
    },
  );
}
