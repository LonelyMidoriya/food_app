import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class SignUpUsecase implements FutureUseCase<List<String>, void> {
  final AuthRepository _authRepository;

  const SignUpUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(List<String> input) async {
    return _authRepository.signUp(
      input[0],
      input[1],
    );
  }
}
