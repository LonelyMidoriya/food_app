abstract class AuthRepository {
  Future<void> signUp(
    String email,
    String password,
  );
  Future<void> logIn(
    String email,
    String password,
  );
  Future<void> signUpWithGoogle();
  Future<void> signOut();
}
