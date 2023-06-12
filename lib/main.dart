import 'package:ecomarse_firebase/Screen/Bottom/View/BottomScreen.dart';
import 'package:ecomarse_firebase/Screen/Cart/View/CartScreen.dart';
import 'package:ecomarse_firebase/Screen/Home/View/HomeScreen.dart';
import 'package:ecomarse_firebase/Screen/ShowProduct/View/ShowProductScreen.dart';
import 'package:ecomarse_firebase/Screen/SignIn/View/SignInScreen.dart';
import 'package:ecomarse_firebase/Screen/SignUp/View/SignUpScreen.dart';
import 'package:ecomarse_firebase/Screen/Sples/View/SplesScreen.dart';
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
        ],
      ),
    ),
  );
}
