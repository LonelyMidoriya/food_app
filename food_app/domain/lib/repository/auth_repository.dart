abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> logIn(
    String email,
    String password,
  );

  Future<void> signUpWithGoogle();

  Future<void> signOut();

  Future<bool> init();
}
