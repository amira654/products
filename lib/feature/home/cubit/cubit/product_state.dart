

import '../../model/product_model.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List<ProductModel> model;
  ProductSuccess({required this.model});
}
final class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
}
