import '../../../../../imports.dart';

Widget listTileWidgetBonus(
        {leadingImage,
        title,
        subtitle,
        trailingTitle,
        trailingIcon,
        dateTime,
        status}) =>
    Container(
      color: cLightGrey,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Image(image: AssetImage(leadingImage)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: title,
                  size: 15.0,
                  color: cDarkBlack,
                  weight: FontWeight.bold,
                ),
                CustomTextWidget(
                  text: trailingTitle,
                  size: 15.0,
                  color: cDarkBlack,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: subtitle,
                  size: 15.0,
                  color: cDarkBlack,
                  weight: FontWeight.bold,
                ),
                Icon(
                  trailingIcon,
                  color: cDarkBlack,
                  size: 20,
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: dateTime,
                  size: 15.0,
                  color: cTextGrey,
                  weight: FontWeight.bold,
                ),
                Row(
                  children: [
                    CustomTextWidget(
                      text: status == 'valid' ? 'Tap To Claim' : status,
                      size: 15.0,
                      color: status == 'valid' ? cBackgroundGreen : Colors.red,
                      weight: FontWeight.bold,
                    ),
                    status != 'valid'
                        // ignore: prefer_const_constructors
                        ? Icon(
                            Icons.info,
                            color: Colors.red,
                          )
                        : const SizedBox(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
