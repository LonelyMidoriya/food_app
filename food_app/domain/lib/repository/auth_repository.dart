import 'package:core/core.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(
    Credentials credentials,
  );

  Future<void> logIn(
    Credentials credentials,
  );

  Future<void> signUpWithGoogle();

  Future<void> signOut();

  Future<bool> checkIfLoggedIn();
}
