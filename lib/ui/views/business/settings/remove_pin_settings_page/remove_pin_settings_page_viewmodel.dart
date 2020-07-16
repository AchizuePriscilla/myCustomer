import 'package:mycustomers/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mycustomers/core/services/password_manager_services.dart';
import 'package:flutter/material.dart';
import 'package:mycustomers/ui/shared/const_color.dart';
import 'package:mycustomers/ui/shared/size_config.dart';

class RemovePinSettingsPageViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PasswordManagerService _passwordManagerService =
      locator<PasswordManagerService>();

  void onEnterPinCompleted(String value, BuildContext context) async {
    String passFrmDb = await _passwordManagerService
        .getPassword(); // get the password stored in the db
    int newPassFrmDb = int.parse(passFrmDb); // cast it into an integer
    int confirmPin = int.parse(value); // cast the password entered
    int check = newPassFrmDb.compareTo(confirmPin); // compare they are equal
    print(check);
    if (check == 0) {
      await _passwordManagerService.deleteSetPin();
      setPin(false);
      showAlertDilaog(context);
    } else if (check < 0 || check > 0) {
      _passwordManagerService.showUnmatchedPinErrorMessage();
    } else {
      _passwordManagerService.showRemoveErrorMessage();
    }
  }

  void setPin(bool value) {
    _passwordManagerService.setPin(value);
    notifyListeners();
  }

  Future<void> showAlertDilaog(BuildContext context) async {
    // set up the button
    Widget continueButton = Center(
      child: Container(
        height: SizeConfig.yMargin(context, 5),
        width: SizeConfig.xMargin(context, 50),
        // margin: EdgeInsets.only(bottom: SizeConfig.yMargin(context, 6)),
        decoration: BoxDecoration(color: BrandColors.primary),
        child: FlatButton(
          child: Text("Continue",
              textAlign: TextAlign.center,
              style: TextStyle(color: ThemeColors.background)),
          onPressed: () {
            _navigationService.popRepeated(2);
          },
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Center(
        child: CircleAvatar(
            radius: SizeConfig.yMargin(context, 5),
            backgroundColor: ThemeColors.success,
            child: Icon(
              Icons.check,
              color: BrandColors.primary,
            )),
      ),
      content: Text(
        "Pin Removed",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: SizeConfig.yMargin(context, 2),
            color: BrandColors.primary),
      ),
      actions: [
        Center(child: continueButton),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
