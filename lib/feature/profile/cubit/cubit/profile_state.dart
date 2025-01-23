
import '../../model/profile_model.dart';

sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserLoadingState extends UserProfileState {}

final class UserSuccessState extends UserProfileState {
  final UserProfileModelData userData;
  UserSuccessState({required this.userData});
}

final class UserErrorState extends UserProfileState {
  final String errorMessage;
  UserErrorState({required this.errorMessage});
}
