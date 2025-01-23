
import 'package:flutter_application_2/feature/fav/model/fav_model.dart';

sealed class FavState {}

final class FavInitial extends FavState {}
final class FavLoading extends FavState {}

final class FavSuccess extends FavState {}

final class FavGetSuccess extends FavState {
  List <FavModel> listFav;

  FavGetSuccess({required this.listFav });
}
final class FavErrorState extends FavState {
  String errorMessage;
  FavErrorState({required this.errorMessage});

}
final class FavDelete extends FavState {}
