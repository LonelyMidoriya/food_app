import 'package:core/credentials/credentials.dart';
import 'package:domain/domain.dart';

class LogInUsecase implements FutureUseCase<Credentials, void> {
  final AuthRepository _authRepository;

  const LogInUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(Credentials input) async {
    return _authRepository.logIn(input);
  }
}
