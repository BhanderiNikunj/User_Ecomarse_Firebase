import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserDetailControllor extends GetxController {


  TextEditingController txtFName = TextEditingController();
  TextEditingController txtLName = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  TextEditingController txtEmailId = TextEditingController();
  TextEditingController txtDob = TextEditingController(text: "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}");
  RxString gender = "male".obs;
  RxInt userAdmin = 0.obs;

}
