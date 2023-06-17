import 'package:ecomarse_firebase/Screen/Admin/AddData/View/AddDataScreen.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/View/AdminHomeScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/View/AddUserDetailScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/SignIn/View/SignInScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/SignUp/View/SignUpScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/Sples/View/SplesScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Bottom/View/BottomScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Cart/View/CartScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Home/View/HomeScreen.dart';
import 'package:ecomarse_firebase/Screen/User/ShowProduct/View/ShowProductScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => SplesScreen(),
          ),
          GetPage(
            name: '/signIn',
            page: () => SignInScreen(),
          ),
          GetPage(
            name: '/signUp',
            page: () => SignUpScreen(),
          ),
          GetPage(
            name: '/bottom',
            page: () => BottomScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
          ),
          GetPage(
            name: '/show',
            page: () => ShowProductScreen(),
          ),
          GetPage(
            name: '/cart',
            page: () => CartScreen(),
          ),
          GetPage(
            name: '/adminHome',
            page: () => AdminHomeScreen(),
          ),
          GetPage(
            name: '/addData',
            page: () => AddDataScreen(),
          ),
          GetPage(
            name: '/addUserDetail',
            page: () => AddUserDetailScreen(),
          ),
        ],
      ),
    ),
  );
}
