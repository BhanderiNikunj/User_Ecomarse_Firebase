import 'package:ecomarse_firebase/Screen/User/Profile/Controllor/ProfileControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileControllor profileControllor = Get.put(ProfileControllor(),);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 40.sp,
              ),
              SizedBox(height: 10.sp),
              Text(
                "Bhanderi Nikunj",
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              SizedBox(height: 8.sp),
              Text(
                "+91 6352431889",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 15.sp),
              InkWell(
                onTap: () {
                  Get.toNamed('/cart');
                },
                child: Container(
                  height: 40.sp,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10.sp),
                      Text(
                        "My Orders",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              InkWell(
                onTap: () {
                  // Get.toNamed('/cart');
                },
                child: Container(
                  height: 40.sp,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10.sp),
                      Text(
                        "My Buy Product",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              InkWell(
                onTap: () {
                  profileControllor.signOut();
                },
                child: Container(
                  height: 40.sp,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(width: 10.sp),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
