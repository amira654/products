
import 'package:flutter_application_2/feature/profile/cubit/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post_data.dart';

class ProfileCubit extends Cubit<ProfileCubitStatue> {
  ProfileCubit() : super(InitialProfileCubit());
  ProfileData profileDataUser = ProfileData();

  prfileDataCubit() async {
    emit(LoadingProfileCubit());
    var user = await ProfileData().getProfileData();
    emit(SucessProfileCubit(profileModelUserData: user));
  }
}