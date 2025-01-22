
import '../../model/profile_model.dart';

sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserSuccessState extends UserProfileState {
  final UserProfileModelData userData;
  UserSuccessState({required this.userData});
}

final class UserLoadingState extends UserProfileState {}