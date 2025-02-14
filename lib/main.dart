import 'package:townerapp/network/api_base_helper.dart';

import 'imports.dart';

final navigationKey = GlobalKey<NavigatorState>();
final apiHelper = ApiBaseHelper();
final LocalStorageService localStorageService = LocalStorageService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localStorageService.init();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  String initialRoute = await LocalStorageService().getLastVisited();
  PermissionStatus permissionStatus = await Permission.notification.status;
  if (permissionStatus.isDenied || permissionStatus.isRestricted) {
    permissionStatus = await Permission.notification.request();
  }

  await initializeService();
  runApp(DriverApp(
    initialRoute: initialRoute,
  ));
}
