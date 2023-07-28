import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class SignUpWithEmailAndPasswordUsecase implements FutureUseCase<List<String>, void> {
  final AuthRepository _authRepository;

  const SignUpWithEmailAndPasswordUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(List<String> input) async {
    return _authRepository.signUpWithEmailAndPassword(
      input[0],
      input[1],
    );
  }
}
