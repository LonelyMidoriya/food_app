import 'package:domain/domain.dart';

class SignUpWithEmailAndPasswordUsecase
    implements FutureUseCase<UserModel, void> {
  final AuthRepository _authRepository;

  const SignUpWithEmailAndPasswordUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(UserModel input) async {
    return _authRepository.signUpWithEmailAndPassword(
      user: input,
    );
  }
}
