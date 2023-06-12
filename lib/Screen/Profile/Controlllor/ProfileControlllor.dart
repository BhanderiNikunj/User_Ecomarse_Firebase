import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class ProfileControlllor extends GetxController {
  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
  }
}
