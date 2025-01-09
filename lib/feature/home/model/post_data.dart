import 'package:dio/dio.dart';

import 'product_model.dart';

class ProductData {
  Dio dio = Dio();
  Future<List<ProductModel>> getProducts({required String endPoint}) async {
    try {
      var response = await dio.get(
        'https://fakestoreapi.com/products/category/$endPoint',
      );
      if (response.statusCode == 200) {
        List data = response.data;
        List<ProductModel>  listproduct=data.map((product) => ProductModel.fromJson(product)).toList();
        return listproduct;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}




