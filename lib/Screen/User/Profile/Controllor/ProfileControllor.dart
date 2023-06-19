import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:get/get.dart';

class ProfileControllor extends GetxController {
  void signOut() {
    FirebaseHelper.firebaseHelper.signOut();
    Get.offAndToNamed('/signIn');
  }
}
