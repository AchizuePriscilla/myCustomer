import 'package:flutter/foundation.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/const_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mycustomers/core/localization/app_localization.dart';
import 'edit_profile_viewmodel.dart';
import 'package:flushbar/flushbar_helper.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: customizeAppBar(context, 1.0,
              children: [],
              title: AppLocalizations.of(context).editProfile,
              arrowColor: BrandColors.primary),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: SizeConfig.yMargin(context, 4)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: !kIsWeb &&
                            defaultTargetPlatform == TargetPlatform.android
                        ? FutureBuilder<void>(
                            future: model.retrieveLostData(),
                            builder: (BuildContext context,
                                AsyncSnapshot<void> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return CircleAvatar(
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .notPickedImage,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                case ConnectionState.done:
                                  return _previewImage(context, model);
                                default:
                                  if (snapshot.hasError) {
                                    return Text(
                                      AppLocalizations.of(context).pickImage +
                                          ':' +
                                          '${snapshot.error}}',
                                      textAlign: TextAlign.center,
                                    );
                                  } else {
                                    return Text(
                                      AppLocalizations.of(context)
                                          .notPickedImage,
                                      textAlign: TextAlign.center,
                                    );
                                  }
                              }
                            },
                          )
                        : _previewImage(context, model),
                  ),
                  SizedBox(height: SizeConfig.yMargin(context, 2)),
                  Container(
                    height: SizeConfig.yMargin(context, 6),
                    width: SizeConfig.xMargin(context, 60),
                    decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: CustomRaisedButton(
                      txtColor: ThemeColors.background,
                      btnColor: BrandColors.primary,
                      btnText: model.image == null
                          ? AppLocalizations.of(context).addProfilePicture
                          : AppLocalizations.of(context).changePic,
                      borderColor: BrandColors.primary,
                      child: Container(),
                      onPressed: model.getImagefromGallery,
                    ),
                  ),
                   SizedBox(height: SizeConfig.yMargin(context, 1.4)),
                  Divider(color: ThemeColors.gray.shade600),
                  SizedBox(height: SizeConfig.yMargin(context, 1.4)),
                  Column(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.yMargin(context, 8),
                        width: SizeConfig.xMargin(context, 90),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            border:
                                Border.all(color: ThemeColors.gray.shade600)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.xMargin(context, 4),
                          ),
                          child: TextFormField(
                            initialValue: model.userP.name,
                            keyboardType: TextInputType.text,
                            onChanged: (value) => model.updateUserName(value),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context).userName,
                            ),
                            style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.yMargin(context, 2)),
                      Container(
                        height: SizeConfig.yMargin(context, 8),
                        width: SizeConfig.xMargin(context, 90),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(color: ThemeColors.gray.shade600),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.xMargin(context, 4),
                          ),
                          child: TextFormField(
                            onChanged: (value) =>
                                model.updateBusinessName(value),
                            initialValue: model.businessName,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    AppLocalizations.of(context).businessName),
                            style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.yMargin(context, 25),
                  ),
                  CustomRaisedButton(
                    txtColor: ThemeColors.background,
                    btnColor: BrandColors.primary,
                    btnText: AppLocalizations.of(context).save,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.xMargin(context, 40),
                        vertical: SizeConfig.yMargin(context, 2.6),
                      ),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(3),
                      // ),
                      child: Text(
                        AppLocalizations.of(context).save,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.background,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.yMargin(context, 2),
                        ),
                      ),
                    ),
                    onPressed: () {
                      model.save();
                      FlushbarHelper.createInformation(
                        duration: const Duration(seconds: 5),
                        message: AppLocalizations.of(context).save,
                      ).show(context);
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.yMargin(context, 2),
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (model) => model.initt(),
    );
  }
}

Widget _previewImage(BuildContext context, EditProfileViewModel model) {
  final Text retrieveError = _getRetrieveErrorWidget(model);
  if (retrieveError != null) {
    return retrieveError;
  }

  return CircleAvatar(
    backgroundColor: ThemeColors.unselect,
    child: model.userP.image.length == 0
        ? Text(
            model.userName.isEmpty ? 'N' : model.userName.substring(0, 1),
            style: TextStyle(
              color: BrandColors.primary,
              fontSize: SizeConfig.textSize(context, 18),
              fontWeight: FontWeight.bold,
            ),
          )
        : ClipOval(
            child: model.imageFromBaseString(model.userP.image, context),
          ),
    radius: 70,
  );
}

Text _getRetrieveErrorWidget(EditProfileViewModel model) {
  if (model.retrieveDataError != null) {
    final Text result = Text(model.retrieveDataError);
    model.retrieveDataError = null;
    return result;
  }
  return null;
}
