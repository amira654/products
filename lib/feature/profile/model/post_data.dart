import 'package:dio/dio.dart';
import 'package:flutter_application_2/feature/auth/model/data_auth/data_login.dart';

import 'profile_model.dart';
var getTo=CashToken.shared!.get("newtoken");
class ProfileData {
  Dio dio = Dio();
  getProfileData( ) async {
    var response = await dio.post('https://elwekala.onrender.com/user/profile',
        data: {"token": getTo});
    try {
      var repoData = response.data;
      
      var user = User.fromJson(repoData);
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);

        return error.response!.data;
      }
    }
  }
}
