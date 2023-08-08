import 'package:core/core.dart';
import 'package:domain/model/user_model.dart';

class AuthProvider {
  final GoogleSignIn _googleSignIn;

  AuthProvider({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  Future<void> singUpWithEmailAndPassword({
    required UserModel user,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
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
    required UserModel user,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }
}
