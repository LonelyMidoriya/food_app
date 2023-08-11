import 'package:domain/domain.dart';

class SignOutUsecase implements FutureUseCase<NoParams, void> {
  final AuthRepository _authRepository;

  const SignOutUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams input) async {
    return _authRepository.signOut();
  }
}
