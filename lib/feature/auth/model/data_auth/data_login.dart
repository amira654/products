// // ignore_for_file: avoid_print

// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../core/helper/cash_shared.dart';

// class DataLogin {
//   final Dio dio = Dio();

//   loginData({
//     required email,
//     required password,
//   }) async {
//     var response =
//         await dio.post('https://elwekala.onrender.com/user/login', data: {
//       "email": email,
//       "password": password,
//     });

//     try {
//       var data = response.data;
//       var nId = data["user"]["nationalId"];
//      await CashShared.sharedPreferences!.setString("ID", nId);
//       print(data["user"]["nationalId"]);
//       print(response.statusCode);
//       print(data['message']);
//       print(data["user"]["token"]);

//       return data;
//     } on DioException catch (error) {
//       if (error.response != null) {
//         print(error.response!.data['message']);

//         return error.response!.data;
//       }
//     }
//   }
// }
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../../core/helper/cash_shared.dart';

class DataAuth {
  final Dio dio = Dio();

  postData(
      {required name,
      required email,
      required phone,
      required nationalId,
      required gender,
      required password,
      required token,
      required profileImage}) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/register', data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage
    });

    try {
      var data = response.data;
      print(response.statusCode);
      print(data['message']);
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }

  loginData({
    required email,
    required password,
  }) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/login', data: {
      "email": email,
      "password": password,
    });

    try {
      var user = response.data;
      var newToken = user["user"]["nationalId"];
      print(newToken);
      CacheShared.shared!.setString("ID", newToken);
      print(user["user"]["nationalId"]);
      print(response.statusCode);
      print(user['message']);
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }
}