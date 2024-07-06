part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoginLoading extends UserState {}

final class LoginSuccess extends UserState {
  final List<UserModel> user;

  LoginSuccess({required this.user});
}

final class LoginFailure extends UserState {
  final String message;

  LoginFailure({required this.message});
}

final class RegisterLoading extends UserState {}

final class RegisterSuccess extends UserState {
  final UserModel user;

  RegisterSuccess({required this.user});
}

final class RegisterFailure extends UserState {
  final String message;

  RegisterFailure({required this.message});
}
