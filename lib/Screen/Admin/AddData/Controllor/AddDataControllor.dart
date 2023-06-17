import 'dart:typed_data';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Model/AdminHomeModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDataControllor extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtBrande = TextEditingController();
  TextEditingController txtRate = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtStoke = TextEditingController();

  Future<String> insertProduct({
    required AdminHomeModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertProduct(
      a1: a1,
    );
  }

  Future<String> updateProduct({
    required AdminHomeModel a1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateProduct(
      a1: a1,
    );
  }

  Uint8List? imageBytes;
  RxString ipath = "".obs;
}
