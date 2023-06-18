import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/Model/AddUserModel.dart';
import 'package:ecomarse_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplesScreen extends StatefulWidget {
  const SplesScreen({Key? key}) : super(key: key);

  @override
  State<SplesScreen> createState() => _SplesScreenState();
}

class _SplesScreenState extends State<SplesScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed('/signIn');
      },
    );
    return SafeArea(
      child: Scaffold(
        // body: StreamBuilder(
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return CircularProgressIndicator();
        //     } else if (snapshot.hasData) {
        //       DocumentSnapshot? snapData = snapshot.data;
        //
        //       AddUserModel a1 = AddUserModel(
        //         fName: snapData!['fName'],
        //         lName: snapData['lName'],
        //         emailId: snapData['emailId'],
        //         fcmToken: snapData['fcmToken'],
        //         dob: snapData['dob'],
        //         adminUser: snapData['userAdmin'],
        //         gender: snapData['gender'],
        //         mobileNo: snapData['mobileNo'],
        //       );
        //
        //       print(a1.fName);
        //
        //       Timer(
        //         Duration(seconds: 3),
        //         () {
        //           if (a1.adminUser == 1) {
        //             Get.offAndToNamed('/bottom');
        //           } else {
        //             Get.offAndToNamed('/adminHome');
        //           }
        //         },
        //       );
        //       return Center(
        //         child: FlutterLogo(
        //           size: 100.sp,
        //         ),
        //       );
        //     }
        //     return Center(
        //       child: FlutterLogo(
        //         size: 100.sp,
        //       ),
        //     );
        //   },
        //   stream: FirebaseHelper.firebaseHelper.readUserDetail(),
        // ),
        body: CircularProgressIndicator(),
      ),
    );
  }
}
