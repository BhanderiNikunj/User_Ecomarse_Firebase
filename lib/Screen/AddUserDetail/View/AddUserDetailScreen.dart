import 'package:ecomarse_firebase/Screen/AddUserDetail/Controllor/AddUserDetailControllor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddUserDetailScreen extends StatefulWidget {
  const AddUserDetailScreen({super.key});

  @override
  State<AddUserDetailScreen> createState() => _AddUserDetailScreenState();
}

class _AddUserDetailScreenState extends State<AddUserDetailScreen> {
  AddUserDetailControllor addUserDetailControllor = Get.put(
    AddUserDetailControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.sp),
                  bottomRight: Radius.circular(20.sp),
                ),
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  TextField(
                    controller: addUserDetailControllor.txtFName,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Your First Name",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.pink,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addUserDetailControllor.txtLName,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Your Last Name",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addUserDetailControllor.txtMobileNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Your Mobile No.",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addUserDetailControllor.txtEmailId,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Your Email Id.",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: addUserDetailControllor.txtDob,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            lastDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            initialDate: DateTime.now(),
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DateTimePickerLocale.en_us,
                            looping: true,
                          );

                          setState(() {
                            addUserDetailControllor.txtDob =
                                TextEditingController(
                              text:
                                  "${datePicked!.day} / ${datePicked.month} / ${datePicked.year}",
                            );
                          });
                        },
                        icon: Icon(
                          Icons.date_range,
                        ),
                      ),
                      label: Text(
                        "Enter Your D.O.B",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Obx(
                    () => DropdownButton(
                      value: addUserDetailControllor.gender.value,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          value: "male",
                          child: Text(
                            "Male",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "female",
                          child: Text(
                            "Female",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "other",
                          child: Text(
                            "Other",
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        addUserDetailControllor.gender.value = value!;
                      },
                    ),
                  ),
                  SizedBox(height: 10.sp),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
