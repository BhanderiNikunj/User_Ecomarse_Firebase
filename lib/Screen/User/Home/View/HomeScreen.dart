import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/User/Home/Controllor/HomeControllor.dart';
import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    // homeControllor.userDetail.value = FireHelper.fireHelper.UserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  stream: homeControllor.readData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;

                      homeControllor.DataList.clear();

                      for (var x in snapData!.docs) {
                        HomeModel homeModel = HomeModel(
                          stoke: x['stoke'],
                          rate: x['rate'],
                          price: x['price'],
                          desc: x['desc'],
                          brand: x['brand'],
                          name: x['name'],
                          image: x['image'],
                          key: x.id,
                          isButton: false,
                        );

                        homeControllor.DataList.add(homeModel);
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
                              itemCount: homeControllor.DataList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (homeControllor
                                            .DataList[index].isButton ==
                                        true) {
                                      Get.snackbar(
                                          "You Have Already Click One Time",
                                          "message");
                                    } else {
                                      print(index);
                                      HomeModel homeModel = HomeModel(
                                        key: homeControllor.DataList[index].key,
                                        image: homeControllor
                                            .DataList[index].image,
                                        name:
                                            homeControllor.DataList[index].name,
                                        brand: homeControllor
                                            .DataList[index].brand,
                                        desc:
                                            homeControllor.DataList[index].desc,
                                        price: homeControllor
                                            .DataList[index].price,
                                        rate:
                                            homeControllor.DataList[index].rate,
                                        stoke: homeControllor
                                            .DataList[index].stoke,
                                      );
                                      homeControllor.DataList[index].isButton =
                                          true;
                                      Get.toNamed(
                                        '/show',
                                        arguments: homeModel,
                                      );
                                    }
                                  },
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
                                            "⭐️ ${homeControllor.DataList[index].rate}",
                                          ),
                                          SizedBox(height: 10.sp),
                                          Container(
                                            height: 60.sp,
                                            width: double.infinity,
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                homeControllor.DataList[index]
                                                    .image!.codeUnits,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10.sp),
                                          Container(
                                            height: 20.sp,
                                            child: Text(
                                              "${homeControllor.DataList[index].name}",
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
                                              "${homeControllor.DataList[index].desc}",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15.sp),
                                          Container(
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$ ${homeControllor.DataList[index].price}.00",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.sp,
                                                  width: 30.sp,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.pink,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
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
      ),
    );
  }
}
