// import 'package:townerapp/src/online/invoice/create_invoice_controller.dart';
// import 'package:townerapp/src/online/invoice/model/final_invoice_model.dart';
// import 'package:townerapp/src/online/invoice/route_details/route_details_screen.dart';
// import 'package:townerapp/src/online/invoice/widgets/business_container.dart';
// import 'package:townerapp/src/online/invoice/widgets/rider_container.dart';
// import 'package:townerapp/src/online/invoice/widgets/trip_details_container.dart';
// import '../../../imports.dart';

// class FinalInvoiceScreen extends StatefulWidget {
//   const FinalInvoiceScreen({super.key});

//   @override
//   State<FinalInvoiceScreen> createState() => _FinalInvoiceScreen();
// }

// class _FinalInvoiceScreen extends State<FinalInvoiceScreen> {
//   bool billingDetail = true;
//   bool container1state = true;
//   bool container2state = true;
//   bool container3state = true;

//   Future<void> shareFunction() async {
//     await FlutterShare.share(
//       title: 'Share via',
//       text: 'Thank You for sharing Towner',
//       chooserTitle: 'Share via',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: pPagePadding_12,
//           child: SingleChildScrollView(
//             child: Consumer<CreateInvoiceProvider>(
//               builder: (BuildContext context, provider, Widget? child) {
//                 BookingInvoiceModel? bookingInvoiceData =
//                     provider.bookingInvoiceModel;
//                 return Column(
//                   children: [
//                     CustomHeader(
//                         title:
//                             '${AppLocalizations.of(context)!.bookingId} - ${bookingInvoiceData?.bookingId ?? ''}'),
//                     sizedBoxHeight20,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)!.startDateTime,
//                           style: tsRegularTextBold,
//                         ),
//                         Text(
//                           '${bookingInvoiceData?.startDate ?? ''} | ${bookingInvoiceData?.startTime ?? ''}',
//                           style: tsRegularTextBold,
//                         ),
//                       ],
//                     ),
//                     sizedBoxHeight10,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)!.endDateTime,
//                           style: tsRegularTextBold,
//                         ),
//                         Text(
//                           '${bookingInvoiceData?.endDate ?? ''} | ${bookingInvoiceData?.endTime ?? ''}',
//                           style: tsRegularTextBold,
//                         ),
//                       ],
//                     ),
//                     sizedBoxHeight20,
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: pPaddingHorizontal_10,
//                             child: Consumer<CreateInvoiceProvider>(
//                               builder: (context, provider, child) {
//                                 return CustomButton(
//                                   onTap: () => provider.toggleBillingDetail(),
//                                   title: 'Billing Details',
//                                   optionalColor: provider.isBillingDetail
//                                       ? null
//                                       : cDarkBlack,
//                                   optionalTextColor: provider.isBillingDetail
//                                       ? null
//                                       : cWhiteColor,
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: pPaddingHorizontal_10,
//                             child: CustomButton(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const RouteDetailsScreen(),
//                                   ),
//                                 );
//                               },
//                               title: 'Route Details',
//                               optionalColor: cDarkBlack,
//                               optionalTextColor: cWhiteColor,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     sizedBoxHeight20,
//                     Container(
//                       color: cGreyColor,
//                       child: Padding(
//                         padding: pPagePadding_10,
//                         child: Column(
//                           children: [
//                             const SizedBox(width: double.infinity),
//                             Text(
//                               'Amount to be paid',
//                               style: tsRegularTextBold,
//                             ),
//                             sizedBoxHeight5,
//                             Text(
//                               bookingInvoiceData?.amountTobePaid ?? '',
//                               style: tsLargeTextBold,
//                             ),
//                             sizedBoxHeight5,
//                             Text(
//                               '${AppLocalizations.of(context)!.bookingId} - ${bookingInvoiceData?.bookingId ?? ''}',
//                               style: tsSmallTextBold,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     sizedBoxHeight20,
//                     Consumer<CreateInvoiceProvider>(
//                       builder: (context, provider, child) {
//                         return Column(
//                           children: [
//                             BusinessContainer(
//                                 expanded: provider.isContainer1Expanded),
//                             sizedBoxHeight15,
//                             RiderContainer(
//                                 expanded: provider.isContainer3Expanded),
//                             sizedBoxHeight15,
//                             TripDetailsContainer(
//                                 expanded: provider.isContainer2Expanded),
//                           ],
//                         );
//                       },
//                     ),
//                     sizedBoxHeight20,
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: cWhiteColor,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   AppLocalizations.of(context)!.totalCharges,
//                                   style: tsRegularTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.totalCharges ?? '',
//                                   style: tsRegularText,
//                                 ),
//                               ],
//                             ),
//                             sizedBoxHeight20,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'GST(6%)',
//                                   style: tsRegularTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.gst ?? '',
//                                   style: tsRegularText,
//                                 ),
//                               ],
//                             ),
//                             sizedBoxHeight10,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'SGST(6%)',
//                                   style: tsRegularTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.sgst ?? '',
//                                   style: tsRegularText,
//                                 ),
//                               ],
//                             ),
//                             sizedBoxHeight10,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   AppLocalizations.of(context)!.driverDiscount,
//                                   style: tsRegularTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.driverDiscount ?? '',
//                                   style: tsRegularText,
//                                 ),
//                               ],
//                             ),
//                             sizedBoxHeight10,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .convenienceCharge,
//                                   style: tsRegularTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.convCharges ?? '',
//                                   style: tsRegularText,
//                                 ),
//                               ],
//                             ),
//                             sizedBoxHeight20,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Payable Amount',
//                                   style: tsLargeTextBold,
//                                 ),
//                                 Text(
//                                   bookingInvoiceData?.payableAmount ?? '',
//                                   style: tsLargeTextBold,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'Promotional discount for next ride ${bookingInvoiceData?.promotionalDiscound ?? ''}',
//                       style: tsRegularText,
//                     ),
//                     sizedBoxHeight10,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamedAndRemoveUntil(context,
//                                 RouteClass.homeScreen, (route) => false);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: cBackgroundGreen,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 40, vertical: 10),
//                               child: Text(
//                                 'Confirm',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             shareFunction();
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: cMainGreen,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 35, vertical: 10),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.share_outlined),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     'Share Invoice',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     sizedBoxHeight10,
//                     CustomButton(
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, RouteClass.driverfeedbackscreen);
//                       },
//                       title: 'User Feedback',
//                       optionalColor: cDarkBlack,
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
