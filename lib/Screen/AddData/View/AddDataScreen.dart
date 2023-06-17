import 'dart:io';
import 'dart:typed_data';
import 'package:ecomarse_firebase/Screen/AddData/Controllor/AddDataControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  AddDataControllor addDataControllor = Get.put(
    AddDataControllor(),
  );

  // HomeModel h1 = HomeModel();

  // @override
  // void initState() {
  //   super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  CircleAvatar(
                    backgroundImage: addDataControllor.ipath.isEmpty
                        ? null
                        : MemoryImage(
                            Uint8List.fromList(
                              addDataControllor.ipath.codeUnits,
                            ),
                          ),
                    backgroundColor: Colors.pink,
                    radius: 50.sp,
                  ),
                  SizedBox(height: 10.sp),
                  ElevatedButton(
                    onPressed: () async {
                      ImagePicker imagePiker = ImagePicker();
                      XFile? xfile = await imagePiker.pickImage(
                          source: ImageSource.gallery);
                      String image1 = xfile!.path;

                      File file = File(image1);

                      await file.readAsBytes().then((value) {
                        addDataControllor.imageBytes = value;
                      });

                      addDataControllor.ipath.value =
                          String.fromCharCodes(addDataControllor.imageBytes!);
                    },
                    child: Text(
                      "Image",
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addDataControllor.txtName,
                    decoration: InputDecoration(
                      label: Text("Enter Product Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: addDataControllor.txtPrice,
                    decoration: InputDecoration(
                      label: Text("Enter Product Price"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addDataControllor.txtBrande,
                    decoration: InputDecoration(
                      label: Text("Enter Product Brand"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addDataControllor.txtRate,
                    decoration: InputDecoration(
                      label: Text("Enter Product Rate"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addDataControllor.txtStoke,
                    decoration: InputDecoration(
                      label: Text("Enter Product Stoke"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addDataControllor.txtDesc,
                    maxLines: 3,
                    decoration: InputDecoration(
                      label: Text("Enter Product Description"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  InkWell(
                    onTap: () async {
                      // if (h1.status == 1) {
                      //
                      //   print(h1.key);
                      //   HomeModel homeModel = HomeModel(
                      //     stoke:
                      //         int.parse("${addDataControllor.txtStoke.text}"),
                      //     brand: addDataControllor.txtBrande.text,
                      //     rate:
                      //         double.parse("${addDataControllor.txtRate.text}"),
                      //     price: int.parse("${addDataControllor.txtRate.text}"),
                      //     desc: addDataControllor.txtDesc.text,
                      //     image: addDataControllor.ipath.value,
                      //     name: addDataControllor.txtName.text,
                      //     key: h1.key,
                      //   );
                      //   print(homeModel.key);
                      //   String msg = await addDataControllor.updateProduct(
                      //     h1: homeModel,
                      //   );
                      //
                      //   Get.snackbar("$msg", "");
                      //
                      //   Get.back();
                      // } else {
                      //   String msg = await addDataControllor.insertProduct(
                      //     name: addDataControllor.txtName.text,
                      //     price:
                      //         int.parse("${addDataControllor.txtPrice.text}"),
                      //     desc: addDataControllor.txtDesc.text,
                      //     rate:
                      //         double.parse("${addDataControllor.txtRate.text}"),
                      //     stoke:
                      //         int.parse("${addDataControllor.txtStoke.text}"),
                      //     brand: addDataControllor.txtBrande.text,
                      //     image: addDataControllor.ipath.value,
                      //   );
                      //
                      //   Get.snackbar("$msg", "");
                      //
                      //   Get.back();
                      // }
                    },
                    child: Container(
                      width: 60.sp,
                      height: 30.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            color: Colors.pink.shade900,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.pink,
                      ),
                      child: Text(
                        // h1.status == 1 ? "Update" : "Submit",
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
