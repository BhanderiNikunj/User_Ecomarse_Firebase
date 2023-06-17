import 'package:ecomarse_firebase/Screen/User/Cart/View/CartScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Home/View/HomeScreen.dart';
import 'package:get/get.dart';

class BottomControllor extends GetxController {
  int bottom = 0;
  List Screen = [
    HomeScreen(),
    CartScreen(),
    // CartScreen(),
    // ProfileScreen(),
  ];
}
