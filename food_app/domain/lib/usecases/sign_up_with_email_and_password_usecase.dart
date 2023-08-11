import 'package:core/credentials/credentials.dart';
import 'package:domain/domain.dart';

class SignUpWithEmailAndPasswordUsecase
    implements FutureUseCase<Credentials, void> {
  final AuthRepository _authRepository;

  const SignUpWithEmailAndPasswordUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(Credentials input) async {
    return _authRepository.signUpWithEmailAndPassword(
      credentials: input,
    );
  }
}
