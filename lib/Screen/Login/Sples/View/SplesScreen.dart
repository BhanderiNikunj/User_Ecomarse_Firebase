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
  List<AddUserModel> detailList = [];

  @override
  void initState() {
    super.initState();

    FirebaseHelper.firebaseHelper.FindUid();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FirebaseHelper.firebaseHelper.FindUid() == null
            ? notLogin()
            : login(),

        // body: FlutterLogo(),
      ),
    );
  }

  Widget login() {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          print("=============");
          QuerySnapshot? snapData = snapshot.data;
          print(snapData);
          print(snapshot);
          detailList.clear();

          for (var x in snapData!.docs) {
            AddUserModel a1 = AddUserModel(
              fName: x['fName'],
              lName: x['lName'],
              emailId: x['emailId'],
              fcmToken: x['fcmToken'],
              dob: x['dob'],
              adminUser: x['userAdmin'],
              gender: x['gender'],
              mobileNo: x['mobileNo'],
              key: x.id,
            );

            detailList.add(a1);

            print(detailList.length);
          }

          Timer(
            Duration(seconds: 3),
            () {
              if (detailList[0].adminUser == 1) {
                print(
                    "--------------------------------------------------------");
                Get.offAndToNamed('/bottom');
              } else {
                print("====================================================");
                Get.offAndToNamed('/adminHome');
              }
            },
          );

          return Center(
            child: FlutterLogo(
              size: 100.sp,
            ),
          );
        }
        return Center(
          child: FlutterLogo(
            size: 100.sp,
          ),
        );
      },
      stream: FirebaseHelper.firebaseHelper.readUserDetail(),
    );
  }

  Widget notLogin() {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAndToNamed('/signIn');
      },
    );
    return Center(
      child: FlutterLogo(
        size: 100.sp,
      ),
    );
  }
}
