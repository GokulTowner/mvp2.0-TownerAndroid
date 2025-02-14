import 'imports.dart';

void main() async {
  EnvConfig prodConfig = EnvConfig(
    appName: appName,
    baseUrl: ApiEndPoints.prod.baseUrl,
    shouldCollectLog: false,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  // final settingsController = SettingsController(SettingsService());

  // await settingsController.loadSettings();

  runApp(const DriverApp(
    initialRoute: '/',
  ));
}
