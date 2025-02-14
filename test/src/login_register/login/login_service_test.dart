import 'package:flutter_test/flutter_test.dart';
import 'package:townerapp/imports.dart';

void main() {
  late LoginService loginService;

  setUp(() {
    loginService = LoginService();
  });
  group(
    'LoginService',
    () {
      group(
        'login function',
        () {
          test(
            'Given login service class when driver login function is called and status code 200 then Driver Model should be return',
            () async {
              //Arrange
              LoginModel data = LoginModel(mobile: '1111111111', password: '1');
              //Act
              final loginStatus =
                  await loginService.postLoginRequest(data, true);

              //Assert
              expect(loginStatus, isA<Map<String, dynamic>>());
            },
          );
          test(
            'Given login service class when login function is called and the status is not 200 ',
            () async {
              //Arrange
              LoginModel data = LoginModel(mobile: '111111111', password: '1');
              //Act
              final loginStatus =
                  await loginService.postLoginRequest(data, true);

              //Assert
              expect(loginStatus, null);
            },
          );
        },
      );
    },
  );
}
