import 'package:domain/domain.dart';

class LogInUsecase implements FutureUseCase<UserModel, void> {
  final AuthRepository _authRepository;

  const LogInUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(UserModel input) async {
    return _authRepository.logIn(
      user: input,
    );
  }
}
