
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthLoadingState extends AuthState {}

class AuthSucessState extends AuthState {
  final Map<String, dynamic> userdata;

  AuthSucessState({required this.userdata});
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});
}
class ChooseImage extends AuthState {}

