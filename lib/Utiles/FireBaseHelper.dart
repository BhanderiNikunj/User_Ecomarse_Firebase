import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomarse_firebase/Screen/Admin/AdminHome/Model/AdminHomeModel.dart';
import 'package:ecomarse_firebase/Screen/Login/AddUserDetail/Model/AddUserModel.dart';
import 'package:ecomarse_firebase/Screen/User/Home/Model/HomeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // login

  Future<String> signUp({
    required email,
    required password,
  }) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Future<String> signIn({
    required email,
    required password,
  }) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  bool checkLogin() {
    User? user = firebaseAuth.currentUser;
    var uid = user?.uid;
    // ignore: unnecessary_null_comparison
    if (uid == null) {
      return false;
    } else {
      return true;
    }
  }

  String? FindUid() {
    User? user = firebaseAuth.currentUser;
    var uid = user?.uid;
    return uid;
  }

  Future<String> findFCMToken() async {
    var fcmToken = await firebaseMessaging.getToken();

    return fcmToken!;
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  // Product

  Future<String> insertProduct({
    required AdminHomeModel a1,
  }) async {
    return await firebaseFirestore.collection("product").add(
      {
        "name": a1.name,
        "price": a1.price,
        "desc": a1.desc,
        "rate": a1.rate,
        "stoke": a1.stoke,
        "brand": a1.brand,
        "image": a1.image,
      },
    ).then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Future<String> updateProduct({
    required AdminHomeModel a1,
  }) async {
    print(a1.key);
    return await firebaseFirestore.collection("product").doc(a1.key).set(
      {
        "name": a1.name,
        "price": a1.price,
        "desc": a1.desc,
        "rate": a1.rate,
        "stoke": a1.stoke,
        "brand": a1.brand,
        "image": a1.image,
      },
    ).then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() {
    return firebaseFirestore.collection("product").snapshots();
  }

  Future<void> deleteProduct({
    required key,
  }) async {
    await firebaseFirestore.collection("product").doc(key).delete();
  }

  // Add to Cart

  void insertCart({
    required HomeModel h1,
  }) {
    firebaseFirestore.collection("data").doc(FindUid()).collection("cart").add(
      {
        "name": h1.name,
        "price": h1.price,
        "desc": h1.desc,
        "rate": h1.rate,
        "stoke": h1.stoke,
        "brand": h1.brand,
        "image": h1.image,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readCart() {
    return firebaseFirestore
        .collection("data")
        .doc(FindUid())
        .collection("cart")
        .snapshots();
  }

  void deleteData({required key}) {
    firebaseFirestore
      ..collection("data")
          .doc(FindUid())
          .collection("cart")
          .doc("$key")
          .delete();
  }

  // profile

  Future<String> insertUserDetail({
    required AddUserModel a1,
  }) async {
    return await firebaseFirestore
        .collection("data")
        .doc(FindUid())
        .collection("profile")
        .add(
          {
            "fName": a1.fName,
            "lName": a1.lName,
            "mobileNo": a1.mobileNo,
            "emailId": a1.emailId,
            "gender": a1.gender,
            "userAdmin": a1.adminUser,
            "dob": a1.dob,
            "fcmToken": await findFCMToken(),
          },
        )
        .then((value) => "success")
        .catchError((e) => "failed");
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserDetail() {
    return firebaseFirestore
        .collection("data")
        .doc(FindUid())
        .collection("profile")
        .snapshots();
  }
}
