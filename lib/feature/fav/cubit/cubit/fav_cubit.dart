import 'package:flutter_application_2/feature/fav/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  static FavCubit get(context) => BlocProvider.of(context);
  FavCubit() : super(FavInitial());

  final FavData favData = FavData();

  addFavCubit({required String productId}) {
    emit(FavLoading());
    favData.addFav(productId: productId);
    emit(FavSuccess());
  }
}
