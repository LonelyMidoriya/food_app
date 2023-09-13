import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider _authProvider;
  final SharedPreferences _sharedPreferences;

  const AuthRepositoryImpl({
    required AuthProvider authProvider,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _authProvider = authProvider;

  @override
  Future<void> logIn(
    Credentials credentials,
  ) async {
    await _authProvider.logIn(credentials);
    _sharedPreferences
      ..setString(
        'uid',
        _authProvider.firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        _authProvider.firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<void> signUpWithGoogle() async {
    await _authProvider.singUpWithGoogle();
    _authProvider.firebaseAuth.currentUser;
    _sharedPreferences
      ..setString(
        'uid',
        _authProvider.firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        _authProvider.firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<void> signOut() async {
    await _authProvider.singOut();
    _sharedPreferences
      ..setBool(
        'isLoggedIn',
        false,
      )
      ..setString(
        'uid',
        '',
      )
      ..setString(
        'email',
        '',
      );
  }

  @override
  Future<void> signUpWithEmailAndPassword(
    Credentials credentials,
  ) async {
    await _authProvider.singUpWithEmailAndPassword(credentials);
    _sharedPreferences
      ..setString(
        'uid',
        _authProvider.firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        _authProvider.firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<bool> checkIfLoggedIn() async {
    final bool isLoggedIn;

    if (_authProvider.firebaseAuth.currentUser == null) {
      _sharedPreferences
        ..setBool(
          'isLoggedIn',
          false,
        )
        ..setString(
          'uid',
          '',
        )
        ..setString(
          'email',
          '',
        );
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
      _sharedPreferences
        ..setString(
          'uid',
          _authProvider.firebaseAuth.currentUser!.uid,
        )
        ..setString(
          'email',
          _authProvider.firebaseAuth.currentUser!.email!,
        )
        ..setBool(
          'isLoggedIn',
          true,
        );
    }
    return isLoggedIn;
  }
}
