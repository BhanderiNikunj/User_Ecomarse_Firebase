import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class CartContollor extends GetxController {
  List<HomeModel> cartList = [];

  int subTotal = 0;
  int discount = 20;
  int delivery = 100;
  int total = 0;

  RxInt Quantity = 1.obs;
  RxInt Quantity1 = 1.obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    return FirebaseHelper.firebaseHelper.readCart();
  }

  void deleteData({required key}) {
    FirebaseHelper.firebaseHelper.deleteData(
      key: key,
    );
  }
}
