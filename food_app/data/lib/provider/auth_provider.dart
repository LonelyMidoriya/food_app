import 'package:core/core.dart';

class AuthProvider {
  final GoogleSignIn _googleSignIn;

  const AuthProvider({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  Future<void> singUpWithEmailAndPassword({
    required Credentials credentials,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: credentials.email,
      password: credentials.password,
    );
  }

  Future<void> singUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> singOut() async {
    await firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> logIn({
    required Credentials credentials,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: credentials.email,
      password: credentials.password,
    );
  }
}
