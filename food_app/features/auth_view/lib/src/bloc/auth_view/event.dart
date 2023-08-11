part of 'bloc.dart';

abstract class AuthViewEvent {}

class AuthInitEvent implements AuthViewEvent {}

class UserSignoutEvent implements AuthViewEvent {}

class UserSignupWithGoogleEvent implements AuthViewEvent {}

class UserSignupWithEmailAndPasswordEvent implements AuthViewEvent {
  final String email;
  final String password;

  const UserSignupWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class UserLogInEvent implements AuthViewEvent {
  final String email;
  final String password;

  const UserLogInEvent({
    required this.email,
    required this.password,
  });
}
