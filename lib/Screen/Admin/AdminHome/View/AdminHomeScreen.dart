import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Controllor/AdminHomeControllor.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Model/AdminHomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  AdminHomeControllor adminHomeControllor = Get.put(
    AdminHomeControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      Text(
                        "Location",
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Center(
                child: Container(
                  height: 35.sp,
                  width: 300.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFF0F0),
                        Color(0xffFFDFDF),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50.sp,
                          width: 50.sp,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        Container(
                          height: 50.sp,
                          width: 100.sp,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Search...",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Expanded(
                child: StreamBuilder(
                  stream: adminHomeControllor.readProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;

                      adminHomeControllor.dataList.clear();

                      for (var x in snapData!.docs) {
                        AdminHomeModel a1 = AdminHomeModel(
                          key: x.id,
                          name: x['name'],
                          rate: x['rate'],
                          price: x['price'],
                          desc: x['desc'],
                          image: x['image'],
                          brand: x['brand'],
                          stoke: x['stoke'],
                          status: 0,
                        );
                        adminHomeControllor.dataList.add(a1);
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200.sp,
                              ),
                              itemCount: adminHomeControllor.dataList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "⭐️ ${adminHomeControllor.dataList[index].rate}",
                                          ),
                                          SizedBox(height: 10.sp),
                                          Container(
                                            height: 80.sp,
                                            width: double.infinity,
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                adminHomeControllor
                                                    .dataList[index]
                                                    .image!
                                                    .codeUnits,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          Container(
                                            height: 20.sp,
                                            child: Text(
                                              "${adminHomeControllor.dataList[index].name}",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          Container(
                                            height: 10.sp,
                                            child: Text(
                                              "${adminHomeControllor.dataList[index].desc}",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.sp),
                                          Container(
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$ ${adminHomeControllor.dataList[index].price}.00",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    AdminHomeModel a1 =
                                                        AdminHomeModel(
                                                      status: 1,
                                                      stoke: adminHomeControllor
                                                          .dataList[index]
                                                          .stoke,
                                                      brand: adminHomeControllor
                                                          .dataList[index]
                                                          .brand,
                                                      image: adminHomeControllor
                                                          .dataList[index]
                                                          .image,
                                                      desc: adminHomeControllor
                                                          .dataList[index].desc,
                                                      price: adminHomeControllor
                                                          .dataList[index]
                                                          .price,
                                                      rate: adminHomeControllor
                                                          .dataList[index].rate,
                                                      name: adminHomeControllor
                                                          .dataList[index].name,
                                                      key: adminHomeControllor
                                                          .dataList[index].key,
                                                    );

                                                    Get.toNamed(
                                                      '/addData',
                                                      arguments: a1,
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 30.sp,
                                                    width: 30.sp,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.pink,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 10.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                      // return Text("123");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AdminHomeModel a1 = AdminHomeModel(
              status: 0,
            );
            Get.toNamed(
              '/addData',
              arguments: a1,
            );
          },
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
