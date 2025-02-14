import '../imports.dart';

class RouteClass {
  static const String splashScreen = '/';
  static const String splashLoadingScreen = '/splash_loading_screen';
  static const String introScreen = '/intro_screen';
  static const String homeScreen = '/home_screen';
  static const String settingView = '/setting_view';
  static const String indroscreen = '/indro_screen';
  static const String createAccountIntroScreen = '/create_account_intro_screen';
  static const String termsOfServiceScreen = '/terms_of_service_screen';
  static const String languageSelectScreen = '/language_select_screen';
  static const String ownerDriverSelectionScreen =
      '/owner_driver_selection_screen';
  static const String loginScreen = '/login_screen';
  static const String createAccountLoginScreen = '/create_account_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String otpVarificationScreen = '/otp_varification_screen';
  static const String createNewPasswordScreen = '/create_new_password_screen';
  static const String landingScreenOwner = '/landing_screen_owner';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String landingScreenDriver = '/landing_screen_driver';
  static const String notificationScreen = '/notification_screen';
  static const String subscriptiondetailsscreen =
      '/subscription_details_screen';
  static const String buysubscriptionscreen = '/buy_subscription_screen';
  static const String recommendedplans = '/recommended_plans';
  static const String payingsubscriptionscreen = '/paying_subscription_screen';
  static const String paymentloadingprogress = '/payment_loading_progress';
  static const String driverprofilescreen = '/driver_profile_screen';
  static const String adddriverscreen = '/add_driver_screen';
  static const String driverlicensescreen = '/driver_license_screen';
  static const String drivergovidscreen = '/driver_govid_screen';
  static const String vehicleprofilesscreen = '/vehicle_profiles_screen';
  static const String addvehiclescreen1 = '/add_vehicle_screen1';
  static const String vehiclephotosscreen = '/vehicle_photos_screen';
  static const String vehicleinsurancescreen = '/vehicle_insurance_screen';
  static const String vehiclepermitscreen = '/vehicle_permit_screen';
  static const String vehicleroadtaxscreen = '/vehicle_road_taxs_creen';
  static const String vehicleemissionscreen = '/vehicle_emission_screen';
  static const String vehiclefitnessscreen = '/vehicle_fitness_screen';
  static const String vehiclercscreen = '/vehicle_rc_screen';
  static const String invoicebill = '/invoice_bill';
  static const String businessstep1 = '/business_step1';
  static const String businessstep2 = '/business_step2';
  static const String bankaccountscreen = '/bank_account_screen';
  static const String passbookandchequescreen = '/passbook_and_cheque_screen';
  static const String subscriptiondriverscreen = '/subscription_driver_screen';
  static const String mywalletscreen = '/my_wallet_screen';
  static const String withdrawmoneyscreen = '/withdraw_money_screen';
  static const String addmoneyscreen = '/add_money_screen';
  static const String sentmoneywalletscreen = '/sent_money_wallet_screen';
  static const String wallettransctionhistoryscreen =
      '/wallet_transction_history_screen';
  static const String reportscreen = '/report_screen';
  static const String communitymainscreen = '/community_main_screen';
  static const String termsandconditiondrawerscreen =
      '/terms_and_condition_drawer_screen';
  static const String privacypolicyscreen = '/privacy_policy_screen';
  static const String contactusscreen = '/contact_us_screen';
  static const String tickethistorscreen = '/ticket_history_screen';
  static const String raisenewticketscreen = '/raise_new_ticket_screen';
  static const String faqsscreen = '/faqs_screen';
  static const String homescreen = '/home_screen';
  static const String intripMapScreen = '/intrip_map_screen';
  static const String createinvoicescreen = '/create_invoice_screen';
  static const String routedetailsscreen = '/route_details_screen';
  static const String qrcodepaymentscreen = '/qr_code_payment_screen';
  static const String finalinvoicescreen = '/final_invoice_screen';
  static const String driverfeedbackscreen = '/driver_feedback_screen';
  static const String raiseticketscreen = '/raise_ticket_screen';
  static const String sosmodescreen = '/sos_mode_screen';
  static const String tripsharescreen = '/trip_share_screen';
  static const String cancelgotohome = '/cancel_goto_home';
  static const String owntripstartscreen = '/own_trip_start_screen';
  static const String qrcodedriverriderscreen = '/qr_code_driver_rider_screen';
  static const String performancereportscreen = '/performance_report_screen';
  static const String businescontactsscreen = '/business_contacts_screen';
  static const String mytrips = '/my_trips';
  static const String businessanalyticsscreen = '/business_analytics_screen';
  static const String settingsscreen = '/settings_screen';
  static const String profitandloss = '/profit_and_loss';
  static const String scheduledtripscreen = '/scheduled_trip_screen';
  static const String viewnotificationscreen = '/view_notification_screen';
  static const String ownerrcnumberscreen = '/owner_rc_number_screen';
  static const String owneradharscreen = '/owner_adhar_screen';
  static const String ownerpancardscreen = '/owner_pancard_screen';
  static const String bonusscreen = '/bonus_screen';
  static const String settingsscreenowner = '/settings_screen_owner';
  static const String driverdisplaycardscreen = '/driver_display_card_screen';
  static const String driverpolicevarcreen = '/driver_police_var_creen';
  static const String driveruniqueidscreen = '/driver_unique_id_screen';
  static const String legalScreen = '/legal_screen';
  static const String incomingridecontainer = '/incoming_ride_container';
  static const String estimationridecontainer = '/estimation_ride_container';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    '/splash_loading_screen': (context) => const SplashLoadingScreen(),
    '/settings_screen': (context) => const SettingsScreen(),
    '/indro_screen': (context) => const IndroScreen(),
    '/create_account_intro_screen': (context) =>
        const CreateAccountIntroScreen(),
    '/terms_of_service_screen': (context) => const TermsOfServiceScreen(),
    '/language_select_screen': (context) => LanguageSelectScreen(),
    '/owner_driver_selection_screen': (context) =>
        const UserRoleSelectionScreen(),
    '/login_screen': (context) => LoginScreen(),
    '/create_account_screen': (context) => CreateAccountScreen(),
    '/forgot_password_screen': (context) => ForgorPasswordScreen(),
    '/otp_varification_screen': (context) => ForgorPasswordScreen(),
    '/create_new_password_screen': (context) => CreateNewPasswordScreen(flag: 0,mobileN0: "",otp: "0",isOwner: false,),
    '/landing_screen_owner': (context) => LandingScreenOwner(),
    '/edit_profile_screen': (context) => EditProfileScreen(),
    '/landing_screen_driver': (context) => LandingScreenDriver(),
    NotificationScreen.route: (context) => const NotificationScreen(),
    '/subscription_details_screen': (context) =>
        const SubscriptionDetailsScreen(), //changed
    '/buy_subscription_screen': (context) => const BuySubscriptionScreen(),
    '/recommended_plans': (context) => const RecommentedPlans(vehId: ''),
    '/paying_subscription_screen': (context) =>
        const PayingSubscriptionScreen(),
    '/payment_loading_progress': (context) => const PaymentLoadingProgress(),
    '/driver_profile_screen': (context) => const DriverProfileScreen(),
    '/add_driver_screen': (context) => const AddDriverScreen(),
    '/driver_license_screen': (context) => const DriverLicenseScreen(),
    '/driver_govid_screen': (context) => const DriverGovIdScreen(),
    '/vehicle_profiles_screen': (context) => const VehicleProfilesScreen(),
    '/add_vehicle_screen1': (context) => const AddVehicleScreen(),
    '/vehicle_photos_screen': (context) => const VehiclePhotosScreen(),
    '/vehicle_insurance_screen': (context) => const VehicleInsuranceScreen(),
    '/vehicle_permit_screen': (context) => const VehiclePermitScreen(),
    '/vehicle_road_taxs_creen': (context) => const VehicleRoadTaxScreen(),
    '/vehicle_emission_screen': (context) => const VehicleEmissionScreen(),
    '/vehicle_fitness_screen': (context) => const VehicleFitnessScreen(),
    '/vehicle_rc_screen': (context) => const VehicleRcScreen(),
    '/invoice_bill': (context) => const InvoiceBillScreen(),
    '/business_step1': (context) => const BusinessStep1(),
    '/business_step2': (context) => const BusinessStep2(),
    '/bank_account_screen': (context) => const BankAccountScreen(),
    '/passbook_and_cheque_screen': (context) => const PassbookAndChequeScreen(),
    '/subscription_driver_screen': (context) =>
        const SubscriptionDriverScreen(),
    '/my_wallet_screen': (context) => const MyWalletScreen(),
    '/withdraw_money_screen': (context) => WithdrawMoneyScreen(),
    '/add_money_screen': (context) => const AddMoneyScreen(),
    '/sent_money_wallet_screen': (constext) =>
        const SentMoneyWalletScreen(totalAmount: 0),
    '/wallet_transction_history_screen': (context) =>
        const TransctionHistoryScreen(),
    '/community_main_screen': (context) => const CommunityMainScreen(),
    '/terms_and_condition_drawer_screen': (context) =>
        const TermsAndConditionDrawerScreen(),
    '/privacy_policy_screen': (context) => const PrivacyPolicyScreen(),
    '/contact_us_screen': (context) => const ContactUsScreen(),
    '/ticket_history_screen': (context) => const TicketHistoryScreen(),
    '/raise_new_ticket_screen': (context) => const RaiseNewTicketScreen(),
    '/faqs_screen': (context) => const FaqsScreen(),
    '/home_screen': (context) => const HomeMapScreen(),
    '/intrip_map_screen': (context) => const IntripMapScreen(),
    '/create_invoice_screen': (context) => const CreateInvoiceScreen(flag: 0),
    '/route_details_screen': (context) => const RouteDetailsScreen(),
    '/qr_code_payment_screen': (context) => const QRCodePaymentScreen(),
    // '/final_invoice_screen': (context) => const FinalInvoiceScreen(),
    '/driver_feedback_screen': (context) => const DriverFeedbackScreen(),
    '/raise_ticket_screen': (context) => const RaiseTicketScreen(),
    '/sos_mode_screen': (context) => const SosModeScreen(),
    '/trip_share_screen': (context) => const TripShareScreen(),
    '/qr_code_driver_rider_screen': (context) =>
        const QrCodeDriverRiderScreen(),
    '/business_contacts_screen': (context) => const BusinessContactsScreen(),
    '/my_trips': (context) => const MyTrips(),
    '/business_analytics_screen': (context) => const BusinessAnalyticsScreen(),
    '/settings_screen_owner': (context) => const SettingsScreenOwner(),
    '/profit_and_loss': (context) => const ProfitAndLoss(),
    '/scheduled_trip_screen': (context) => const SheduledTripScreen(),
    '/owner_adhar_screen': (context) => const OwnerAdharScreen(),
    '/owner_rc_number_screen': (context) => const OwnerRcNumberScreen(),
    '/owner_pancard_screen': (context) => const OwnerPancardScreen(),
    '/bonus_screen': (context) => const BonusScreen(),
    '/driver_display_card_screen': (context) => const DriverDisplayCardScreen(),
    '/driver_police_var_creen': (context) => const DriverPoliceVarScreen(),
    '/driver_unique_id_screen': (context) => const DriverUniqueIdScreen(),
    '/legal_screen': (context) => const LegalPage(),
    '/incoming_ride_container': (context) => const IncomingRideContainer(),
    '/estimation_ride_container': (context) => const EstimationRideContainer(),
  };
}
