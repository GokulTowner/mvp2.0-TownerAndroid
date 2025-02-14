import '../../../../../imports.dart';

Widget imageWithBar(name, percentage, String image) {
  return Container(
    height: 70,
    color: cLightGrey,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: pPagePadding_8,
          child: CircleAvatar(
            backgroundColor: cWhiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image(image: AssetImage(image)),
            ),
          ),
        ),
        SizedBox(
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                        text: name,
                        size: 13,
                        color: cDarkBlack,
                        weight: FontWeight.bold),
                    SizedBox(
                      width: 80,
                      child: CustomTextWidget(
                          text: '$percentage%',
                          size: 13,
                          color: cDarkBlack,
                          weight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                backgroundColor: cDarkBlack,
                barRadius: const Radius.circular(10.0),
                width: 270.0,
                lineHeight: 8.0,
                percent: percentage / 100,
                progressColor: cBackgroundGreen,
              )
            ],
          ),
        )
      ],
    ),
  );
}
