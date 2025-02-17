import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthData {
  final Dio dio = Dio();
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
      var newToken = data["user"]["token"];
      print(newToken);

      print(response.statusCode);
      print(data['message']);
     await CashToken.shared!.setString("token", newToken);
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);

        return error.response!.data;
      }
    }
  }
}

class CashToken {
  static SharedPreferences? shared;
  static init() async {
    shared = await SharedPreferences.getInstance();
  }
}
