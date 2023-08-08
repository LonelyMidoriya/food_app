part of 'bloc.dart';

abstract class AuthViewEvent {}

class AuthInitEvent implements AuthViewEvent {}

class UserSignoutEvent implements AuthViewEvent {}

class UserSignupWithGoogleEvent implements AuthViewEvent {}

class UserSignupEvent implements AuthViewEvent {
  final String email;
  final String password;

  UserSignupEvent({
    required this.email,
    required this.password,
  });
}

class UserLogInEvent implements AuthViewEvent {
  final String email;
  final String password;

  UserLogInEvent({
    required this.email,
    required this.password,
  });
}
