import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/post_data.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductData productData;

  ProductCubit(this.productData) : super(ProductInitial());

  Future<void> fetchProducts(String endpoint) async {
    emit(ProductLoading());
    try {
      final products = await productData.getProducts( endPoint: endpoint,);
      emit(ProductSuccess(model: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}

