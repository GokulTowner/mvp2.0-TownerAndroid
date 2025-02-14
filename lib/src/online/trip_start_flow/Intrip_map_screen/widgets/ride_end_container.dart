import '../../../../../imports.dart';

class RideEndedContainer extends StatelessWidget {
  const RideEndedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cWhiteColor,
      ),
      child: SingleChildScrollView(
        child: Consumer<TripComptetedProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            TripComptetedModel? tripCompleted = provider.tripCompletedData;
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: cMainGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: pPagePadding_10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tripCompleted?.tripTime ?? '',
                          style: tsRegularTextBold,
                        ),
                        sizedBoxHeight5,
                        Text(
                          '${tripCompleted?.tripDistance} | ${tripCompleted?.tripStartTime}',
                          style: tsRegularText,
                        ),
                        sizedBoxHeight5,

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: provider.discount,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.driverDiscount,
                                  filled: true,
                                  fillColor: const Color(0xFFEEEEEE),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                                style: const TextStyle(color: Colors.grey),
                                minLines: 1,
                                maxLines: 1,
                              ),
                            ),
                            sizedBoxWidth10,
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: provider.extra,
                                decoration: InputDecoration(
                                  hintText: "Extra Amount",
                                  filled: true,
                                  fillColor: const Color(0xFFEEEEEE),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                                style: const TextStyle(color: Colors.grey),
                                minLines: 1,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, top: 10, bottom: 2),
                          child: CustomButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteClass.createinvoicescreen);
                            },
                            title: AppLocalizations.of(context)!.createInvoice,
                            optionalTextColor: cBackgroundGreen,
                            optionalColor: cDarkBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight10,
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: cWhiteColor,
                          radius: 26,
                          backgroundImage:
                              NetworkImage(tripCompleted?.riderPic ?? ''),
                        ),
                        title: Text(
                          tripCompleted?.riderName ?? '',
                          style: tsRegularTextBold,
                        ),
                        subtitle: Text(
                          '⭐ ${tripCompleted?.riderRating ?? ''}',
                          style: tsSmallTextGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        tripCompleted?.tripAmount ?? '',
                        style: tsLargeTextBold,
                      ),
                    )
                  ],
                ),
                sizedBoxHeight5,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.bookingId} : ${tripCompleted?.bookingId ?? ''}',
                    style: tsRegularText,
                  ),
                ),
                sizedBoxHeight15,
                Padding(
                  padding: pPaddingHorizontal_12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, RouteClass.tripcompletescreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: cWhiteColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: cGrey500,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Image.asset(imgCallLogo),
                                sizedBoxWidth5,
                                Text(
                                  AppLocalizations.of(context)!.callCustomer,
                                  style: tsRegularTextBold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Image.asset(imgShareLogo),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteClass.tripsharescreen);
                            },
                          ),
                          sizedBoxWidth15,
                          InkWell(
                            child: Image.asset(imgSosLogo),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteClass.sosmodescreen);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                sizedBoxHeight10,
              ],
            );
          },
        ),
      ),
    );
  }
}
