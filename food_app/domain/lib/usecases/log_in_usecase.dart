import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class LogInUsecase implements FutureUseCase<List<String>, void> {
  final AuthRepository _authRepository;

  const LogInUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(List<String> input) async {
    return _authRepository.logIn(
      input[0],
      input[1],
    );
  }
}
