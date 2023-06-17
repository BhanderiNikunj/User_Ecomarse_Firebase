import 'package:ecomarse_firebase/Screen/UpdateProfile/Modle/UpdateModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateProfileControllor extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtJob = TextEditingController();
  TextEditingController txtEmailId = TextEditingController();
  RxString adminUser = "admin".obs;

  Future<String> insertProfile({
    required UpdateModel u1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertProfileData(
      u1: u1,
    );
  }

  Future<String> updateProfile({
    required UpdateModel u1,
  }) {
    return FirebaseHelper.firebaseHelper.updateProfile(
      u1: u1,
    );
  }
}
