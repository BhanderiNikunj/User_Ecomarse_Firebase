import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/Model/AddUserModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserDetailControllor extends GetxController {
  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtEmailId = TextEditingController();
  TextEditingController txtDob = TextEditingController(
      text:
          "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");
  RxString gender = "male".obs;
  RxInt userAdmin = 0.obs;

  Future<String> insertUserDetail({
    required AddUserModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertUserDetail(
      a1: a1,
    );
  }

  Future<String> updateDetail({
    required AddUserModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateUserDetail(
      a1: a1,
    );
  }
}
