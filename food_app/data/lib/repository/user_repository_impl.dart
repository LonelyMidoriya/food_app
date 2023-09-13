import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/user_model.dart';
import 'package:domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreProvider _firestoreProvider;
  final SharedPreferences _sharedPreferences;

  const UserRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required SharedPreferences sharedPreferences,
  })  : _firestoreProvider = firestoreProvider,
        _sharedPreferences = sharedPreferences;

  @override
  Future<UserModel> fetchUser() async {
    final UserEntity userEntity = await _firestoreProvider.fetchUser(
      collection: 'users',
      email: _sharedPreferences.getString('email')!,
    );

    return UserMapper.toModel(userEntity);
  }

  @override
  Future<void> addUser() async {
    final UserModel user = UserModel(
      email: _sharedPreferences.getString('email')!,
      uid: _sharedPreferences.getString('uid')!,
      isAdmin: false,
      isSuperAdmin: false,
    );
    await _firestoreProvider.addUser(
      user: UserMapper.toEntity(user),
      collection: 'users',
    );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await _firestoreProvider.updateUser(
      user: UserMapper.toEntity(user),
      collection: 'users',
    );
  }

  @override
  Future<List<UserModel>> fetchUsers() async {
    final List<UserModel> users = [];
    final List<UserEntity> entities =
        await _firestoreProvider.fetchUsers('users');

    for (UserEntity entity in entities) {
      users.add(UserMapper.toModel(entity));
    }

    return users;
  }

  @override
  Future<List<UserModel>> fetchSearchedUsers(String searchQuery) async {
    final List<UserModel> users = [];

    final List<UserEntity> entities =
        await _firestoreProvider.fetchSearchedUsers(
      collection: 'users',
      searchQuery: searchQuery,
    );

    for (UserEntity entity in entities) {
      users.add(UserMapper.toModel(entity));
    }

    return users;
  }
}
