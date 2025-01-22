import 'package:flutter_application_2/feature/cart/cubit/cubit/cart_state.dart';
import 'package:flutter_application_2/feature/cart/model/cart_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartService cartService = CartService();

  getAddToCartCubit() {
    emit(CartLoadingState());
    cartService.gerCartAdd();
    emit(CartSuccessState());
  }
}