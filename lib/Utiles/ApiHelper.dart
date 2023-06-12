// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiHelper {
//   static ApiHelper apiHelper = ApiHelper._();
//
//   ApiHelper._();
//
//   Future<HomeModel> apiCall() async {
//     Uri uri = Uri.parse("https://dummyjson.com/products");
//
//     var result = await http.get(uri);
//
//     var json = jsonDecode(result.body);
//
//     HomeModel homeModel = HomeModel.fromJson(json);
//
//     return homeModel;
//   }
// }
