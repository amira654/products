import 'package:dio/dio.dart';

import '../../auth/view/widget/custom_textField.dart';
import 'profile_model.dart';

var getToken = CashToken.shared!.get("token");

class UserProfileService {
  Future<UserProfileModelData> getUserProfileData() async {
    final Dio dio = Dio();
    var response = await dio.post(
      'https://elwekala.onrender.com/user/profile',
      data: {"token": "b6cipljpfykm69a7odl"},
    );

    try {
      Map<String, dynamic> jsonData = response.data;
      var user = UserProfileModelData.fromJson(jsonData);
      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
    }
    throw Exception();
  }
}