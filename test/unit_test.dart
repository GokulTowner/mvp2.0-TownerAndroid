import 'package:flutter_test/flutter_test.dart';
import 'package:townerapp/imports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//Pre-test
  // setUp(() => null);
  // setUpAll(() => null);

  //setup is called before every test
  // setupAll is called before all the test

  // Setup -> test -> setup -> test -setup -test
  // Setupall -> test -> test -> test

  late LoginProvider loginProvider;

  setUp(() {
    loginProvider = LoginProvider();
  });
  // Testing
  group(
    'Login Provider and login service',
    () {
      // final LoginProvider loginProvider = LoginProvider();
      // LoginService loginService = LoginService();

      test(
          'given login provider when setIsOwnerTrue function call then the value of isOwner should be true ',
          () {
        //Act

        loginProvider.setIsOwnerTrue();
        final value = loginProvider.isOwner;
        //Assert

        expect(value, true);
      });

      test(
        'given login provider when call setIsOwnerTrueFalse function then the value of isOwner should be false',
        () {
          //Act
          loginProvider.setIsOwnerFalse();
          final value = loginProvider.isOwner;
          //Assert

          expect(value, false);
        },
      );

      test(
        'When call this function if the number is 10 digit then it should return null',
        () {
          //Arrange
          String validValue = '1234567890';

          //Act
          final value = loginProvider.mobileValidation(validValue);

          //Assert
          expect(value, null);
        },
      );

      test(
        'When call this function if the number is 10 digit then it should return null',
        () {
          //Arrange
          String validValue = '123456789';

          //Act
          final value = loginProvider.mobileValidation(validValue);

          //Assert
          expect(value, 'Enter valid mobile number');
        },
      );
    },
  );

  //Post-test

  // tearDown(() => null);
  // tearDownAll(() => null);

  // test -> tearDown -> test -> tearDown -> test -> tearDown
  // test -> test -> test -> tearDownAll
}
