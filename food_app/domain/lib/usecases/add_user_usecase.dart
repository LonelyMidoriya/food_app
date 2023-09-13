import 'package:domain/usecases/usecase.dart';

import '../repository/user_repository.dart';

class AddUserUseCase implements FutureUseCase<NoParams, void> {
  final UserRepository _userRepository;

  const AddUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(NoParams input) async {
    _userRepository.addUser();
  }
}
