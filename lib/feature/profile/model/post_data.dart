
import 'package:dio/dio.dart';
import '../model/profile_model.dart';

class UserProfileService {
  Future<UserProfileModelData> getUserProfileData() async {
    final Dio dio = Dio();

    try {
      var response = await dio.post(
        'https://elwekala.onrender.com/user/profile',
        data: {"token": "nt6kitl0dbmm69sk9vw"},
      );

      Map<String, dynamic> jsonData = response.data;
      return UserProfileModelData.fromJson(jsonData);
    } catch (e) {
      throw Exception('Error fetching profile data');
    }
  }
}
