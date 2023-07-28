import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider _authProvider;

  AuthRepositoryImpl(
    this._authProvider,
  );

  @override
  Future<void> logIn(String email, String password) async {
    await _authProvider.logIn(email, password);
    appLocator
        .get<SharedPreferences>()
        .setString('uid', firebaseAuth.currentUser!.uid);
    appLocator
        .get<SharedPreferences>()
        .setString('email', firebaseAuth.currentUser!.email!);
    appLocator.get<SharedPreferences>().setBool(
          'isLoggedIn',
          true,
        );
  }

  @override
  Future<void> signUpWithGoogle() async {
    await _authProvider.singUpWithGoogle();
    appLocator
        .get<SharedPreferences>()
        .setString('uid', firebaseAuth.currentUser!.uid);
    appLocator
        .get<SharedPreferences>()
        .setString('email', firebaseAuth.currentUser!.email!);
    appLocator.get<SharedPreferences>().setBool(
          'isLoggedIn',
          true,
        );
  }

  @override
  Future<void> signOut() async {
    await _authProvider.singOut();
    appLocator.get<SharedPreferences>().setString('uid', '');
    appLocator.get<SharedPreferences>().setString('email', '');
    appLocator.get<SharedPreferences>().setBool('isLoggedIn', false);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _authProvider.singUp(email, password);
    appLocator
        .get<SharedPreferences>()
        .setString('uid', firebaseAuth.currentUser!.uid);
    appLocator
        .get<SharedPreferences>()
        .setString('email', firebaseAuth.currentUser!.email!);
    appLocator.get<SharedPreferences>().setBool(
          'isLoggedIn',
          true,
        );
  }
}
