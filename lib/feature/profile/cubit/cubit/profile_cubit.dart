
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/post_data.dart';
import '../../model/profile_model.dart';
import 'profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  final UserProfileService userProfileService = UserProfileService();

  Future<void> getUserProfileDataCubit() async {
    emit(UserLoadingState());
    try {
      var success = await userProfileService.getUserProfileData();
      emit(UserSuccessState(userData: success));
    } catch (e) {
      emit(UserErrorState(errorMessage: 'Failed to load profile data.'));
    }
  }
}
