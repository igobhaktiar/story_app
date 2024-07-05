part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserLogin extends UserEvent {
  final String username;
  final String password;

  UserLogin({
    required this.username,
    required this.password,
  });
}
