import 'package:core/core.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword({
    required Credentials credentials,
  });

  Future<void> logIn({
    required Credentials credentials,
  });

  Future<void> signUpWithGoogle();

  Future<void> signOut();

  Future<bool> checkIfLoggedIn();
}
