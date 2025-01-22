

import 'package:flutter_application_2/feature/product/cubit/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_service.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
 ProductService productService = ProductService();

  getProductDataCubit() async {
    emit(ProductLoadingState());
    var success = await productService.getProductsData();
    emit(ProductSuccessState(productData: success));
  }
}
