import 'package:domain/domain.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword({
    required UserModel user,
  });

  Future<void> logIn({
    required UserModel user,
  });

  Future<void> signUpWithGoogle();

  Future<void> signOut();

  Future<bool> init();
}
