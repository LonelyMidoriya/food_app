import '../model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchUsers();

  Future<UserModel> fetchUser();

  Future<void> addUser();

  Future<void> updateUser(UserModel user);

  Future<List<UserModel>> fetchSearchedUsers(String searchQuery);
}
