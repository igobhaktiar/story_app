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

class UserRegister extends UserEvent {
  final String name;
  final String email;
  final String username;
  final String password;

  UserRegister({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });
}
