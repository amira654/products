import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post_data.dart';
import 'profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  UserProfileService userProfileService = UserProfileService();

  getUserProfileDataCubit() async {
    emit(UserLoadingState());
    var success = await userProfileService.getUserProfileData();
    emit(UserSuccessState(userData: success));
  }
}