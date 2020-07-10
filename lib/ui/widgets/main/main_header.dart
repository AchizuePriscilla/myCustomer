part of '../../views/main/main_view.dart';

class MainHeader extends HookViewModelWidget<MainViewModel> {
  MainHeader({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    MainViewModel model,
  ) {
    return Container(
      color: BrandColors.primary,
      height: SizeConfig.yMargin(context, 12),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: SizeConfig.yMargin(context, -12.0),
            left: SizeConfig.yMargin(context, -10.0),
            child: circleDesign(SizeConfig.yMargin(context, 10),
                SizeConfig.yMargin(context, 7)),
          ),
          Positioned(
            top: SizeConfig.yMargin(context, -12.0),
            right: SizeConfig.yMargin(context, -12.0),
            child: circleDesign(SizeConfig.yMargin(context, 10),
                SizeConfig.yMargin(context, 7)),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.xMargin(context, 3),
              right: SizeConfig.xMargin(context, 3),
              top: SizeConfig.yMargin(context, 4),
              bottom: SizeConfig.yMargin(context, 2),
            ),
            child: headerBar(context, model),
          ),
        ],
      ),
    );
  }

  Widget headerBar(
    BuildContext context,
    MainViewModel model,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: model.openMenu,
          child: Row(
            children: <Widget>[
              GFAvatar(
                minRadius: SizeConfig.xMargin(context, 6),
                maxRadius: SizeConfig.xMargin(context, 6),
                shape: GFAvatarShape.standard,
                backgroundColor: ThemeColors.background,
                child: Text(
                  model.stores[model.selectedBusiness]?.name
                      ?.substring(0, 1) ?? 'n',
                  style: TextStyle(
                    color: ThemeColors.black,
                    fontSize: SizeConfig.textSize(context, 8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(
                width: SizeConfig.xMargin(context, 3),
              ),
              Text(
                model.stores[model.selectedBusiness]?.name ?? ' none',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeColors.background,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.textSize(context, 6),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Container(
          child: Stack(
            children: [
              Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ],
            overflow: Overflow.clip,
          ),
        ),
      ],
    );
  }
}
