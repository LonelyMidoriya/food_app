import 'package:domain/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class CheckIfLoggedInUsecase implements FutureUseCase<NoParams, bool> {
  final AuthRepository _authRepository;

  const CheckIfLoggedInUsecase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _authRepository.checkIfLoggedIn();
  }
}
