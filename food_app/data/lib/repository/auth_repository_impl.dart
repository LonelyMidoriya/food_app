import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider _authProvider;
  final SharedPreferences prefs;

  AuthRepositoryImpl(
    this._authProvider,
    this.prefs,
  );

  @override
  Future<void> logIn(String email, String password) async {
    await _authProvider.logIn(email, password);
    prefs.setString('uid', firebaseAuth.currentUser!.uid);
    prefs.setString('email', firebaseAuth.currentUser!.email!);
    prefs.setBool(
      'isLoggedIn',
      true,
    );
  }

  @override
  Future<void> signUpWithGoogle() async {
    await _authProvider.singUpWithGoogle();
    prefs.setString('uid', firebaseAuth.currentUser!.uid);
    prefs.setString('email', firebaseAuth.currentUser!.email!);
    prefs.setBool(
      'isLoggedIn',
      true,
    );
  }

  @override
  Future<void> signOut() async {
    await _authProvider.singOut();
    prefs.setString('uid', '');
    prefs.setString('email', '');
    prefs.setBool('isLoggedIn', false);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _authProvider.singUpWithEmailAndPassword(email, password);
    prefs.setString('uid', firebaseAuth.currentUser!.uid);
    prefs.setString('email', firebaseAuth.currentUser!.email!);
    prefs.setBool(
      'isLoggedIn',
      true,
    );
  }

  @override
  Future<bool> init() async {
    final bool isLoggedIn;

    if (firebaseAuth.currentUser == null) {
      await prefs.setBool(
        'isLoggedIn',
        false,
      );
      await prefs.setString(
        'uid',
        '',
      );
      await prefs.setString(
        'email',
        '',
      );
      isLoggedIn = false;
    } else {
      isLoggedIn = await prefs.getBool(
        'isLoggedIn',
      )!;
    }
    return isLoggedIn;
  }
}
