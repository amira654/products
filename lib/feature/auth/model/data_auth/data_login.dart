
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataLogin {
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
       var newToken = data["user"]["token"];
      print(response.statusCode);
      print(data['message']);
      print(data["token"]);
      print(newToken);
      CashToken.shared!.setString("token", newToken);

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
