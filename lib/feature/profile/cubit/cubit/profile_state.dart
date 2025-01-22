

import 'package:flutter_application_2/feature/profile/model/profile_model.dart';

class ProfileCubitStatue {}
class InitialProfileCubit extends ProfileCubitStatue {}
class SucessProfileCubit extends ProfileCubitStatue {
  final User profileModelUserData ;
  SucessProfileCubit({required this.profileModelUserData});
}
class LoadingProfileCubit extends ProfileCubitStatue {}