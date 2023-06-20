import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/Model/AddUserModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class ProfileControllor extends GetxController {
  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
    Get.offAndToNamed('/signIn');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return FirebaseHelper.firebaseHelper.readUserDetail();
  }

  List<AddUserModel> detailList = [];
}
