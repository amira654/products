
import 'package:flutter_application_2/feature/cart/model/cart_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartGetAllSuccess extends CartState {
  List <CartModel> listCart;
  CartGetAllSuccess({required this.listCart});
}

final class CartDelete extends CartState {}
