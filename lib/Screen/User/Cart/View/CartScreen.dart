import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/User/Cart/Controllor/CartControllor.dart';
import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartContollor cartContollor = Get.put(
    CartContollor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              cartContollor.cartList.clear();
              for (var x in snapData!.docs) {
                Map data = x.data() as Map;

                HomeModel homeModel = HomeModel(
                  key: x.id,
                  image: data['image'],
                  name: data['name'],
                  brand: data['brand'],
                  desc: data['desc'],
                  price: data['price'],
                  rate: data['rate'],
                  stoke: data['stoke'],
                );

                cartContollor.cartList.add(homeModel);

                cartContollor.total = 0;
                for (int i = 0; i < cartContollor.cartList.length; i++) {
                  cartContollor.total += cartContollor.cartList[i].price!;
                }

                print(cartContollor.total);
                cartContollor.discountPrice = cartContollor.total * 0.2;
                cartContollor.discount =
                    cartContollor.total - cartContollor.discountPrice;
                print(cartContollor.discountPrice);
                print(cartContollor.discount);
              }
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.sp),
                    Text(
                      "Order Details",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30.sp),
                    Container(
                      height: 350.sp,
                      child: ListView.builder(
                        itemCount: cartContollor.cartList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80.sp,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                    color: Colors.black12,
                                  )
                                ],
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 7.sp),
                                  Container(
                                    height: 70.sp,
                                    width: 70.sp,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: Colors.black12,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.memory(
                                      Uint8List.fromList(
                                        cartContollor
                                            .cartList[index].image!.codeUnits,
                                      ),
                                      fit: BoxFit.cover,
                                      height: 70.sp,
                                      width: 70.sp,
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 80.sp,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "${cartContollor.cartList[index].name}",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 90.sp,
                                        height: 10.sp,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          "${cartContollor.cartList[index].desc}",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$ ${cartContollor.cartList[index].price}",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xffD61355),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 80.sp,
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              print(cartContollor
                                                  .cartList[index].key);
                                              cartContollor.deleteData(
                                                key: cartContollor
                                                    .cartList[index].key,
                                              );
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Color(0xffD61355),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (cartContollor
                                                        .Quantity1.value >=
                                                    1) {
                                                  cartContollor
                                                          .Quantity1.value =
                                                      cartContollor
                                                          .Quantity1.value;
                                                } else {
                                                  cartContollor
                                                      .Quantity1.value -= 1;
                                                }
                                              },
                                              child: Container(
                                                height: 25.sp,
                                                width: 25.sp,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffFDE6E9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5.sp,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                "${cartContollor.Quantity1.value}",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cartContollor.Quantity1.value +=
                                                    1;
                                              },
                                              child: Container(
                                                height: 25.sp,
                                                width: 25.sp,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffD61355),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Center(
                      child: Container(
                        height: 100.sp,
                        width: 250.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffF8030F),
                              Color(0xffDB114B),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.asset(
                                "Assets/Images/patten.png",
                                fit: BoxFit.cover,
                                height: 100.sp,
                                width: 250.sp,
                                color: Colors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub Total",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        cartContollor.cartList.isNotEmpty?"\$ ${cartContollor.total}":"\$ 0",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "20 %",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount Price",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        cartContollor.cartList.isNotEmpty?"\$ ${cartContollor.discount.toInt()}":"\$ 0",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
            return CircularProgressIndicator();
          },
          stream: cartContollor.readData(),
        ),
      ),
    );
  }
}
