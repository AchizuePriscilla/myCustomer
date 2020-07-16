part of '../../../views/business/business_card_page/business_cardpage_view.dart';

class _BusinessCard1 extends HookViewModelWidget<BusinessCardPageViewModel> {
  _BusinessCard1({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BusinessCardPageViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.xMargin(context, 1),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.yMargin(context, 30),
            decoration: BoxDecoration(
              color: ThemeColors.background,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/business_card_1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, 5),
            left: SizeConfig.xMargin(context, 30),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: model.businessCard.storeName,
                style: TextStyle(
                  fontSize: SizeConfig.textSize(context, 5),
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n${model.businessCard.tagLine.capitalize}',
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: SizeConfig.xMargin(context, 30),
            top: SizeConfig.yMargin(context, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "  ${model.businessCard.personalName}",
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n   ${model.businessCard.position}',
                            style: TextStyle(
                              fontSize: SizeConfig.textSize(context, 3),
                              color: ThemeColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 0.4),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                    ),
                    Text(
                      "   ${model.businessCard.phoneNumber}",
                      style: TextStyle(
                        fontSize: SizeConfig.textSize(context, 3),
                        color: ThemeColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 0.4),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                    ),
                    Text(
                      "   ${model.businessCard.emailAddress}",
                      style: TextStyle(
                        fontSize: SizeConfig.textSize(context, 3),
                        color: ThemeColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: SizeConfig.yMargin(context, 3),
            left: SizeConfig.xMargin(context, 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: SizeConfig.textSize(context, 3),
                  color: ThemeColors.black,
                ),
                Text(
                  "   ${model.businessCard.address}",
                  style: TextStyle(
                    fontSize: SizeConfig.textSize(context, 3),
                    color: ThemeColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessCard2 extends HookViewModelWidget<BusinessCardPageViewModel> {
  _BusinessCard2({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BusinessCardPageViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.xMargin(context, 1),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.yMargin(context, 30),
            decoration: BoxDecoration(
              color: ThemeColors.background,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/business_card_2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, 4),
            left: SizeConfig.xMargin(context, 25),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: model.businessCard.storeName,
                style: TextStyle(
                  fontSize: SizeConfig.textSize(context, 5),
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.black,
                  fontStyle: FontStyle.italic,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n${model.businessCard.tagLine.capitalize}',
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: SizeConfig.xMargin(context, 25),
            top: SizeConfig.yMargin(context, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "${model.businessCard.personalName}",
                    style: TextStyle(
                      height: SizeConfig.textSize(context, 0.5),
                      fontSize: SizeConfig.textSize(context, 3),
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n${model.businessCard.position}',
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          color: ThemeColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '\n${model.businessCard.phoneNumber}',
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          color: ThemeColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '\n${model.businessCard.emailAddress}',
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          color: ThemeColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: SizeConfig.yMargin(context, 2),
            left: SizeConfig.xMargin(context, 25),
            child: Text(
              model.businessCard.address,
              style: TextStyle(
                fontSize: SizeConfig.textSize(context, 3),
                color: ThemeColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessCard3 extends HookViewModelWidget<BusinessCardPageViewModel> {
  _BusinessCard3({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BusinessCardPageViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.xMargin(context, 1),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.yMargin(context, 30),
            decoration: BoxDecoration(
              color: ThemeColors.background,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/business_card_3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, 5),
            left: SizeConfig.xMargin(context, 50),
            right: SizeConfig.xMargin(context, 5),
            bottom: SizeConfig.yMargin(context, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: model.businessCard.storeName,
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 5),
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n${model.businessCard.tagLine.capitalize}',
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          color: ThemeColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 3),
                ),
                Text(
                  " ${model.businessCard.phoneNumber}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: SizeConfig.textSize(context, 3),
                    color: ThemeColors.black,
                  ),
                ),
                Text(
                  " ${model.businessCard.emailAddress}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: SizeConfig.textSize(context, 3),
                    color: ThemeColors.black,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 3),
                ),
                Text(
                  model.businessCard.address,
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: SizeConfig.textSize(context, 3),
                    color: ThemeColors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, 5),
            left: SizeConfig.xMargin(context, 5),
            right: SizeConfig.xMargin(context, 60),
            bottom: SizeConfig.yMargin(context, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.account_circle,
                    size: SizeConfig.textSize(context, 15),
                  ),
                  minRadius: SizeConfig.textSize(context, 7),
                  maxRadius: SizeConfig.textSize(context, 8),
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 1),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "  ${model.businessCard.personalName}",
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3),
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.background,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n  ${model.businessCard.position}',
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 2),
                          color: ThemeColors.background,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessCard4 extends HookViewModelWidget<BusinessCardPageViewModel> {
  _BusinessCard4({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    BusinessCardPageViewModel model,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.xMargin(context, 1),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.yMargin(context, 30),
            decoration: BoxDecoration(
              color: ThemeColors.background,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/images/business_card_4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, 5),
            left: SizeConfig.xMargin(context, 10),
            right: SizeConfig.xMargin(context, 10),
            // TODO change font to Gilroy-Bold
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: model.businessCard.storeName,
                style: TextStyle(
                  fontSize: SizeConfig.textSize(context, 5),
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n${model.businessCard.tagLine.capitalize}',
                    style: TextStyle(
                      fontSize: SizeConfig.textSize(context, 3),
                      color: ThemeColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: SizeConfig.xMargin(context, 5),
            bottom: SizeConfig.yMargin(context, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: SizeConfig.textSize(context, 4),
                      color: ThemeColors.background,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "  ${model.businessCard.personalName}",
                        style: TextStyle(
                          fontSize: SizeConfig.textSize(context, 3),
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.background,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n   ${model.businessCard.position}',
                            style: TextStyle(
                              fontSize: SizeConfig.textSize(context, 2),
                              color: ThemeColors.background,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 0.7),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: SizeConfig.textSize(context, 3),
                      color: ThemeColors.background,
                    ),
                    Text(
                      "   ${model.businessCard.phoneNumber}",
                      style: TextStyle(
                        fontSize: SizeConfig.textSize(context, 3),
                        color: ThemeColors.background,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.yMargin(context, 0.7),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: SizeConfig.textSize(context, 3),
                      color: ThemeColors.background,
                    ),
                    Text(
                      "   ${model.businessCard.emailAddress.toLowerCase()}",
                      style: TextStyle(
                        fontSize: SizeConfig.textSize(context, 3),
                        color: ThemeColors.background,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: SizeConfig.yMargin(context, 3),
            right: SizeConfig.xMargin(context, 5),
            left: SizeConfig.xMargin(context, 55),
            child: Text(
              model.businessCard.address,
              textAlign: TextAlign.right,
              softWrap: true,
              style: TextStyle(
                fontSize: SizeConfig.textSize(context, 3),
                color: ThemeColors.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}