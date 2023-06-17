import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Model/AdminHomeModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class AdminHomeControllor extends GetxController {

  List<AdminHomeModel> dataList = [];
  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() {
    return FirebaseHelper.firebaseHelper.readProduct();
  }
}
