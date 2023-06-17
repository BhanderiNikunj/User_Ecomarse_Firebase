import 'dart:typed_data';
import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
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
    required name,
    required price,
    required desc,
    required rate,
    required stoke,
    required brand,
    required image,
  }) async {
    return await FirebaseHelper.firebaseHelper.insertProduct(
      name: name,
      image: image,
      desc: desc,
      price: price,
      rate: rate,
      brand: brand,
      stoke: stoke,
    );
  }

  Future<String> updateProduct({
    required HomeModel h1,
  }) async {
    return await FirebaseHelper.firebaseHelper.updateProduct(
      h1: h1,
    );
  }

  Uint8List? imageBytes;
  RxString ipath = "".obs;
}
