import 'package:domain/domain.dart';

class SignUpWithGoogleUsecase implements FutureUseCase<NoParams, void> {
  final AuthRepository _authRepository;

  const SignUpWithGoogleUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams input) async {
    return _authRepository.signUpWithGoogle();
  }
}
