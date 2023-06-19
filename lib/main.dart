import 'package:ecomarse_firebase/Screen/Admin/AddData/View/AddDataScreen.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/View/AdminHomeScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/View/AddUserDetailScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/SignIn/View/SignInScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/SignUp/View/SignUpScreen.dart';
import 'package:ecomarse_firebase/Screen/Login/Sples/View/SplesScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Bottom/View/BottomScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Cart/View/CartScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Home/View/HomeScreen.dart';
import 'package:ecomarse_firebase/Screen/User/Profile/View/ProfileScreen.dart';
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
            page: () => const SplesScreen(),
          ),
          GetPage(
            name: '/signIn',
            page: () => const SignInScreen(),
          ),
          GetPage(
            name: '/signUp',
            page: () => const SignUpScreen(),
          ),
          GetPage(
            name: '/bottom',
            page: () => const BottomScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/show',
            page: () => const ShowProductScreen(),
          ),
          GetPage(
            name: '/cart',
            page: () => const CartScreen(),
          ),
          GetPage(
            name: '/adminHome',
            page: () => const AdminHomeScreen(),
          ),
          GetPage(
            name: '/addData',
            page: () => const AddDataScreen(),
          ),
          GetPage(
            name: '/addUserDetail',
            page: () => const AddUserDetailScreen(),
          ),
          GetPage(
            name: '/profile',
            page: () => const ProfileScreen(),
          ),
        ],
      ),
    ),
  );
}
