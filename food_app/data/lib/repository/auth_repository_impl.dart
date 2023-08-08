import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider authProvider;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl({
    required this.authProvider,
    required this.sharedPreferences,
  });

  @override
  Future<void> logIn({
    required UserModel user,
  }) async {
    await authProvider.logIn(user: user);
    sharedPreferences
      ..setString(
        'uid',
        firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<void> signUpWithGoogle() async {
    await authProvider.singUpWithGoogle();
    sharedPreferences
      ..setString(
        'uid',
        firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<void> signOut() async {
    await authProvider.singOut();
    sharedPreferences
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
  Future<void> signUpWithEmailAndPassword({
    required UserModel user,
  }) async {
    await authProvider.singUpWithEmailAndPassword(user: user);
    sharedPreferences
      ..setString(
        'uid',
        firebaseAuth.currentUser!.uid,
      )
      ..setString(
        'email',
        firebaseAuth.currentUser!.email!,
      )
      ..setBool(
        'isLoggedIn',
        true,
      );
  }

  @override
  Future<bool> init() async {
    final bool isLoggedIn;

    if (firebaseAuth.currentUser == null) {
      sharedPreferences
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
      isLoggedIn = sharedPreferences.getBool(
        'isLoggedIn',
      )!;
    }
    return isLoggedIn;
  }
}
