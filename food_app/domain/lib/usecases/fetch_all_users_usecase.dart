import 'package:domain/usecases/usecase.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

class FetchAllUsersUseCase
    implements FutureUseCase<NoParams, List<UserModel>> {
  final UserRepository _userRepository;

  const FetchAllUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<UserModel>> execute(NoParams input) async {
    return _userRepository.fetchUsers();
  }
}
