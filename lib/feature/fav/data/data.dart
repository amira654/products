import 'package:dio/dio.dart';

class FavData {
  final Dio dio = Dio();
  addFav({ required String productId}) async {
    var response = await dio.post("https://elwekala.onrender.com/favorite",
        data: {
          "nationalId":'37776456788746' ,//'37776456788746'  "01056710052789"
          "productId": productId
        });

        var data = response.data;
        print(data);
        return data;

  }
}
