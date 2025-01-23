import 'package:dio/dio.dart';
import 'package:flutter_application_2/feature/fav/model/fav_model.dart';

class FavData {
  static final Dio dio = Dio();
  addFav({required String productId}) async {
    var response =
        await dio.post("https://elwekala.onrender.com/favorite", data: {
      "nationalId": '37776456788746', //'37776456788746'  "01056710052789"
      "productId": productId
    });

    var data = response.data;
    print(data);
    return data;
  }

  getAllFav() async {
    var response =
        await dio.get("https://elwekala.onrender.com/favorite", data: {
      "nationalId": '37776456788746', //'37776456788746'  "01056710052789"
      "productId": "64666d3a91c71d884185b774"
    });

    try {
      List responsedata = response.data["favoriteProducts"];
      List<FavModel> listFav =
          responsedata.map((e) => FavModel.fromJson(e)).toList();
      print(listFav[1].image);
      return listFav;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return e.response!.data;
      }
    }
  }

  deleteFav({required String productId}) async {
    var response =
        await dio.delete("https://elwekala.onrender.com/favorite", data: {
      "nationalId": '37776456788746',
      "productId": productId,
    });

    try {
      var data = response.data;
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return e.response!.data;
      }
    }
  }
}
