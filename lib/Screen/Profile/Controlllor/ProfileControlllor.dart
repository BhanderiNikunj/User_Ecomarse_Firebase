import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/UpdateProfile/Modle/UpdateModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class ProfileControlllor extends GetxController {
  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    return FirebaseHelper.firebaseHelper.readProfileData();
  }

  List<UpdateModel> dataList = [];
}
