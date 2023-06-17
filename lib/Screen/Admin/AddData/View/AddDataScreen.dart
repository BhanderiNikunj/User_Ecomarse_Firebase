import 'dart:io';
import 'dart:typed_data';
import 'package:ecomarse_firebase/Screen/Admin/AddData/Controllor/AddDataControllor.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Model/AdminHomeModel.dart';
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

  AdminHomeModel a1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    if (a1.status == 1) {
      addDataControllor.txtName = TextEditingController(
        text: "${a1.name}",
      );
      addDataControllor.txtBrande = TextEditingController(
        text: "${a1.brand}",
      );
      addDataControllor.txtDesc = TextEditingController(
        text: "${a1.desc}",
      );
      addDataControllor.txtPrice = TextEditingController(
        text: "${a1.price}",
      );
      addDataControllor.txtRate = TextEditingController(
        text: "${a1.rate}",
      );
      addDataControllor.txtStoke = TextEditingController(
        text: "${a1.stoke}",
      );
      addDataControllor.ipath.value = a1.image!;
    }
  }

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
                      if (a1.status == 1) {
                        print("update");
                        AdminHomeModel adminModel = AdminHomeModel(
                          image: addDataControllor.ipath.value,
                          price: int.parse(addDataControllor.txtPrice.text),
                          rate: double.parse(addDataControllor.txtRate.text),
                          name: addDataControllor.txtName.text,
                          brand: addDataControllor.txtBrande.text,
                          desc: addDataControllor.txtDesc.text,
                          stoke: int.parse(addDataControllor.txtStoke.text),
                          key: a1.key,
                        );
                        String msg = await addDataControllor.updateProduct(
                          a1: adminModel,
                        );

                        Get.snackbar(
                          "$msg",
                          "",
                        );
                        Get.back();
                      } else {
                        print("insert");
                        AdminHomeModel adminModel = AdminHomeModel(
                          image: addDataControllor.ipath.value,
                          price: int.parse(addDataControllor.txtPrice.text),
                          rate: double.parse(addDataControllor.txtRate.text),
                          name: addDataControllor.txtName.text,
                          brand: addDataControllor.txtBrande.text,
                          desc: addDataControllor.txtDesc.text,
                          stoke: int.parse(addDataControllor.txtStoke.text),
                        );
                        String msg = await addDataControllor.insertProduct(
                          a1: adminModel,
                        );

                        Get.snackbar(
                          "$msg",
                          "",
                        );

                        if (msg == "success") {
                          Get.back();
                        }
                      }
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
                        a1.status == 1 ? "Update" : "Submit",
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
