import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/Model/AddUserModel.dart';
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
  ProfileControllor profileControllor = Get.put(
    ProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: profileControllor.readUserDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              profileControllor.detailList.clear();

              for (var x in snapData!.docs) {
                AddUserModel addUserModel = AddUserModel(
                  key: x.id,
                  adminUser: x['userAdmin'],
                  dob: x['dob'],
                  gender: x['gender'],
                  fcmToken: x['fcmToken'],
                  emailId: x['emailId'],
                  fName: x['fName'],
                  lName: x['lName'],
                  mobileNo: x['mobileNo'],
                );

                profileControllor.detailList.add(addUserModel);
              }
              return Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPressed: () {
                            if (profileControllor.detailList.isEmpty) {
                              AddUserModel a1 = AddUserModel(
                                status: 1,
                              );

                              Get.toNamed(
                                '/addUserDetail',
                                arguments: a1,
                              );
                              print("======================================");
                            } else {
                              AddUserModel a1 = AddUserModel(
                                adminUser:
                                    profileControllor.detailList[0].adminUser,
                                key: profileControllor.detailList[0].key,
                                status: 1,
                                dob: profileControllor.detailList[0].dob,
                                emailId:
                                    profileControllor.detailList[0].emailId,
                                fcmToken:
                                    profileControllor.detailList[0].fcmToken,
                                fName: profileControllor.detailList[0].fName,
                                gender: profileControllor.detailList[0].gender,
                                lName: profileControllor.detailList[0].lName,
                                mobileNo:
                                    profileControllor.detailList[0].mobileNo,
                              );

                              Get.toNamed('/addUserDetail', arguments: a1);
                              print(
                                  "--------------------------------------------");
                            }
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 40.sp,
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      profileControllor.detailList.isEmpty
                          ? "Name :- "
                          : "Name :- ${profileControllor.detailList[0].fName} ${profileControllor.detailList[0].lName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Text(
                      profileControllor.detailList.isEmpty
                          ? "Mobile No. :- "
                          : "Mobile No. :- +91 ${profileControllor.detailList[0].mobileNo}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Text(
                      profileControllor.detailList.isEmpty
                          ? "Gender :- "
                          : "Gender :- ${profileControllor.detailList[0].gender}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Text(
                      profileControllor.detailList.isEmpty
                          ? "Dob :- "
                          : "Dob :- ${profileControllor.detailList[0].dob}",
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
