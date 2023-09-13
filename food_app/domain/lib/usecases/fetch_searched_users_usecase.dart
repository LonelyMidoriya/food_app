import 'package:domain/usecases/usecase.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

class FetchSearchedUsersUseCase implements FutureUseCase<String, List<UserModel>> {
  final UserRepository _userRepository;

  const FetchSearchedUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<UserModel>> execute(String input) async {
    return _userRepository.fetchSearchedUsers(input);
  }
}
