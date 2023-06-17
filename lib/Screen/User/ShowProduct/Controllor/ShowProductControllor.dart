import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class ShowProductControllor extends GetxController {
  void insertCart({
    required HomeModel h1,
  }) {
    FirebaseHelper.firebaseHelper.insertCart(
      h1: h1,
    );
  }
}
