import 'dart:developer';
import 'package:get/get.dart';
import 'package:townerapp/src/edit_profile/vehicle_profile_driver/add_vehicle/add_vehicle_controller.dart';

import 'imports.dart';

class DriverApp extends StatelessWidget {
  final String initialRoute;
  const DriverApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    log('Initial route screen : $initialRoute');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => OtpVarificationProvider()),
        ChangeNotifierProvider(create: (context) => SystemSettingsController()),
        ChangeNotifierProvider(create: (context) => SplashLoadingProvider()),
        ChangeNotifierProvider(create: (context) => IntroProvider()),
        ChangeNotifierProvider(create: (context) => LocalStorageService()),
        ChangeNotifierProvider(
            create: (context) => CreateAccountPageProvider()),
        ChangeNotifierProvider(create: (context) => TermsOfServiceProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => CreateAccountProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(
            create: (context) => CreateNewPasswordProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => BuySubscriptionProvider()),
        ChangeNotifierProvider(
            create: (context) => PayingSubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => DriverProfileProvider()),
        ChangeNotifierProvider(create: (context) => AddDriverProvider()),
        ChangeNotifierProvider(create: (context) => DriverLicenseProvider()),
        ChangeNotifierProvider(create: (context) => DriverGovIdProvider()),
        ChangeNotifierProvider(create: (context) => VehicleProfileProvider()),
        ChangeNotifierProvider(create: (context) => AddVehicleProvider()),
        ChangeNotifierProvider(create: (context) => VehiclePhotosProvider()),
        ChangeNotifierProvider(create: (context) => VehicleInsuranceProvider()),
        ChangeNotifierProvider(create: (context) => VehiclePermitProvider()),
        ChangeNotifierProvider(create: (context) => VehicleRoadTaxProvider()),
        ChangeNotifierProvider(create: (context) => VehicleEmissionProvider()),
        ChangeNotifierProvider(create: (context) => VehicleFitnessProvider()),
        ChangeNotifierProvider(create: (context) => VehicleRcProvider()),
        ChangeNotifierProvider(create: (context) => AddMoneyProvider()),
        ChangeNotifierProvider(
            create: (context) => TransactionHistoryProvider()),
        // ChangeNotifierProvider(create: (context) => ReportProvider()),
        ChangeNotifierProvider(create: (context) => ReferFriendsProvider()),
        ChangeNotifierProvider(create: (context) => RaiseNewTicketProvider()),
        ChangeNotifierProvider(create: (context) => QrDriverRiderProvider()),
        // ChangeNotifierProvider(
        //     create: (context) => PerfromanceReportProvider()),
        ChangeNotifierProvider(create: (context) => OwnerSettingsProvider()),
        ChangeNotifierProvider(
            create: (context) => PassbookAndChequeProvider()),
        ChangeNotifierProvider(create: (context) => BusinessProfileProvider()),
        ChangeNotifierProvider(
            create: (context) => AddNewExpenditureProvider()),
        ChangeNotifierProvider(create: (context) => BankAccountProvider()),
        ChangeNotifierProvider(create: (context) => LanguageSelectProvider()),
        ChangeNotifierProvider(create: (context) => GstProvider()),
        ChangeNotifierProvider(create: (context) => OwnerAdharProvider()),
        ChangeNotifierProvider(create: (context) => OwnerPancardProvider()),
        ChangeNotifierProvider(create: (context) => HomeMapProvider()),
        ChangeNotifierProvider(create: (context) => OwnerLandingProvider()),
        ChangeNotifierProvider(create: (context) => RecommentedPlansProvider()),
        ChangeNotifierProvider(
            create: (context) => TicketHistoryOwnerProvider()),
        ChangeNotifierProvider(
            create: (context) => DriverDisplayCardProvider()),
        ChangeNotifierProvider(create: (context) => DriverPolicVarProvider()),
        ChangeNotifierProvider(create: (context) => DriverUniqueIdProvider()),
        ChangeNotifierProvider(create: (context) => DriverAadharCardProvider()),
        ChangeNotifierProvider(create: (context) => DriverPancardProvider()),
        ChangeNotifierProvider(create: (context) => DriverVoterIdProvider()),
        ChangeNotifierProvider(
            create: (context) => SubscriptionDriverProvider()),
        ChangeNotifierProvider(create: (context) => BonusProvider(flag: -1)),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => VehicleSettingsProvider()),
        ChangeNotifierProvider(create: (context) => DriverSettingsProvider()),
        ChangeNotifierProvider(create: (context) => ReportProvider()),
        ChangeNotifierProvider(
            create: (context) => BusinessAnalyticsProvider()),
        ChangeNotifierProvider(create: (context) => ReferHistoryProvider()),
        ChangeNotifierProvider(create: (context) => InviteFriendsProvider()),
        ChangeNotifierProvider(create: (context) => ProfitAndLossProvider()),
        ChangeNotifierProvider(create: (context) => TotalExpenseProvider()),
        ChangeNotifierProvider(create: (context) => TotalEarningsProvider()),
        ChangeNotifierProvider(
            create: (context) => OwnTripServiceTypeProvider()),
        ChangeNotifierProvider(create: (context) => OngoingDriverProvider()),
        ChangeNotifierProvider(create: (context) => PastRideProvider()),
        ChangeNotifierProvider(create: (context) => MyRidesProvider()),
        ChangeNotifierProvider(create: (context) => SheduledProvider()),
        ChangeNotifierProvider(create: (context) => AcceptedRidePovider()),
        ChangeNotifierProvider(
            create: (context) => ScheduledInterestedProvider()),
        ChangeNotifierProvider(create: (context) => BusinessContactProvider()),
        ChangeNotifierProvider(create: (context) => EstimationRideProvider()),
        ChangeNotifierProvider(create: (context) => CountdownTimerController()),
        ChangeNotifierProvider(create: (context) => TripComptetedProvider()),
        ChangeNotifierProvider(create: (context) => FAQProvider()),
        ChangeNotifierProvider(create: (context) => TermsAndServicesProvider()),
        ChangeNotifierProvider(create: (context) => PrivacyPolicyProvider()),
        ChangeNotifierProvider(create: (context) => AboutUsProvider()),
        ChangeNotifierProvider(create: (context) => CountdownProvider()),
        ChangeNotifierProvider(create: (context) => CreateInvoiceProvider()),
        ChangeNotifierProvider(
            create: (context) => VehicleProfileDriverProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => IntripProvider()),
        ChangeNotifierProvider(
            create: (context) => AddBusinessContactProvider()),
        ChangeNotifierProvider(
            create: (context) => ContactUsController(context)),
        ChangeNotifierProvider(
            create: (context) => CreateVehicleProvider()),
      ],
      child: Builder(
        builder: (context) {
          final settingsController = context.watch<SystemSettingsController>();

          return GetMaterialApp(
            // builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: settingsController.language,
            supportedLocales: const [
              Locale('en'),
              Locale('te'),
              Locale('kn'),
              Locale('mr'),
            ],
            theme: ThemeData(primarySwatch: Colors.blue),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            navigatorKey: navigationKey,
            routes: RouteClass().routes,
            // initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
