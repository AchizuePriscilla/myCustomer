import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mycustomers/core/constants/hive_boxes.dart';
import 'package:mycustomers/core/models/hive/user_profile/profile_h.dart';
import 'package:mycustomers/ui/shared/size_config.dart';
import 'package:stacked/stacked.dart';
import 'package:mycustomers/app/locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycustomers/core/repositories/store/store_repository.dart';
import 'package:mycustomers/core/services/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mycustomers/core/services/profile_service.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {
  final _storeRepository = locator<StoreRepository>();
  final _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();

  File _imgFile;
  final _imagePicker = ImagePicker();
  String _userName;

  String _retrieveDataError;

  String get retrieveDataError => _retrieveDataError;

  String get userName => _userName;
  String _businessName;

  String get businessName => _businessName;

  File get image => _imgFile;

  String sImage;

  Profile get userP => _profileService.getProfile();
  


  set retrieveDataError(value) {
    _retrieveDataError = value;
  }

  Future getImagefromcamera(String value) async {
    final pickedImage = await _imagePicker.getImage(source: ImageSource.camera);
    _imgFile =File(pickedImage.path);

    notifyListeners();
  }

  Future getImagefromGallery(String value) async {
    final pickedImage =
    await _imagePicker.getImage(source: ImageSource.gallery);
    _imgFile = File(pickedImage.path);
    sImage = base64String(_imgFile.readAsBytesSync());
    notifyListeners();
  }

  Image  imageFromBaseString(String base64String, BuildContext context){
     return Image.memory(base64Decode(base64String),
     width: SizeConfig.xMargin(context, 50),
      height: SizeConfig.xMargin(context, 50),
      fit: BoxFit.cover,
    );
  }

 Uint8List dataFromBase64String(String base64String){
   return base64Decode(base64String);
 } 

  String base64String(Uint8List data){
    return base64Encode(data);
    
  }
 



  void updateUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  void updateBusinessName(String value) {
    _businessName = value;
    notifyListeners();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _imagePicker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      _imgFile = File(response.file.path);
      sImage = base64String(_imgFile.readAsBytesSync());

    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  void save() {
    if(_userName != null || sImage != null) {
      Profile profile = new Profile(name: _userName != null ? _userName : userP.name, image: sImage != null ? sImage : userP.image);
      _profileService.updateProfile(profile);
      _navigationService.back();
    } else {
      _navigationService.back();
    }
  }

  initt() {
    _userName = _authService?.currentUser?.firstName ?? 'None';
    _businessName = StoreRepository?.currentStore?.name ?? 'None';
    notifyListeners();
  }

}
