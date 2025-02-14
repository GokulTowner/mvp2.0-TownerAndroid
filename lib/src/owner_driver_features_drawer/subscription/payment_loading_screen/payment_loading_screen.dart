import '../../../../imports.dart';

class PaymentLoadingProgress extends StatefulWidget {
  const PaymentLoadingProgress({super.key});

  @override
  State<PaymentLoadingProgress> createState() => _PaymentLoadingProgressState();
}

class _PaymentLoadingProgressState extends State<PaymentLoadingProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            const StepIndicator(),
            const SizedBox(
              height: 50.0,
            ),
            CustomTextWidget(
              text: AppLocalizations.of(context)!.pleaseWait,
              size: 30.0,
              color: cDarkBlack,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextWidget(
              text: AppLocalizations.of(context)!.pleaseWaitUnlessUntilYou,
              size: 20.0,
              color: cTextGrey,
              weight: FontWeight.w500,
            ),
            CustomTextWidget(
              text: AppLocalizations.of(context)!.getConfirmationFromUs,
              size: 20.0,
              color: cTextGrey,
              weight: FontWeight.w500,
            ),
            ElevatedButton(
              onPressed: () {
                AppCustomPopup appCustomPopup = AppCustomPopup();
                appCustomPopup.showMessage(
                  context: context,
                  imagePath: imgSuccess,
                  title: AppLocalizations.of(context)!.successful,
                  subTitle: AppLocalizations.of(context)!
                      .yourSubscriptionSuccessfullyUpdated,
                  buttonTitle: AppLocalizations.of(context)!.next,
                  onTap: () {
                    final subscriptionProvider =
                        Provider.of<SubscriptionProvider>(context,
                            listen: false);
                    subscriptionProvider.filterValidSubscriptions();
                    subscriptionProvider.filterNotValidSubscriptions();
                    Navigator.pushNamedAndRemoveUntil(context,
                        RouteClass.landingScreenOwner, (route) => false);
                  },
                );
              },
              child: Text(AppLocalizations.of(context)!.skip),
            ),
          ],
        ),
      ),
    );
  }
}
