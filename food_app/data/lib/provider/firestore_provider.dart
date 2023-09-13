import 'package:core/core.dart';
import 'package:data/data.dart';

class FirestoreProvider {
  final FirebaseFirestore fireStore;
  late QueryDocumentSnapshot<Map<String, dynamic>> _lastVisible;

  FirestoreProvider(this.fireStore);

  Future<DishEntity> fetchDish({
    required String name,
    required String collection,
  }) async {
    final Map<String, dynamic> data = await fireStore
        .collection(collection)
        .where(
          'name',
          isEqualTo: name,
        )
        .get()
        .then((value) => value.docs.first.data());
    return DishEntity.fromJson(data);
  }

  Future<void> updateCart({
    required CartEntity cart,
    required String collection,
    required String userId,
  }) async {
    await fireStore.collection(collection).doc(userId).set(cart.toJson());
  }

  Future<void> updateOrderHistory({
    required OrderHistoryEntity orders,
    required String collection,
    required String userId,
  }) async {
    await fireStore.collection(collection).doc(userId).set(orders.toJson());
  }

  Future<void> addUser({
    required UserEntity user,
    required String collection,
  }) async {
    await fireStore.collection(collection).add(user.toJson());
  }

  Future<void> updateUser({
    required UserEntity user,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldUser = await fireStore
        .collection(collection)
        .where('email', isEqualTo: user.email)
        .get();

    await fireStore
        .collection(collection)
        .doc(oldUser.docs.first.id)
        .set(user.toJson());
  }

  Future<void> addDish({
    required DishEntity dish,
    required String collection,
  }) async {
    await fireStore.collection(collection).add(dish.toJson());
  }

  Future<void> updateDish({
    required List<DishEntity> dishes,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldDish = await fireStore
        .collection(collection)
        .where('name', isEqualTo: dishes[0].name)
        .get();
    await fireStore
        .collection(collection)
        .doc(oldDish.docs.first.id)
        .set(dishes[1].toJson());
  }

  Future<void> deleteDish({
    required DishEntity dish,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldDish = await fireStore
        .collection(collection)
        .where('name', isEqualTo: dish.name)
        .get();

    await fireStore.collection(collection).doc(oldDish.docs.first.id).delete();
  }

  Future<List<DishEntity>> fetchFirstDishes({
    required String collection,
    required int limit,
  }) async {
    final List<DishEntity> dishes = [];
    await fireStore
        .collection(collection)
        .orderBy('type')
        .limit(limit)
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        _lastVisible = value.docs[value.size - 1];
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          dishes.add(
            DishEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );
    return dishes;
  }

  Future<List<UserEntity>> fetchUsers(
    String collection,
  ) async {
    final List<UserEntity> users = [];
    await fireStore
        .collection(collection)
        .orderBy(
          'isAdmin',
          descending: true,
        )
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          users.add(
            UserEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return users;
  }

  Future<List<UserEntity>> fetchSearchedUsers({
    required String collection,
    required String searchQuery,
  }) async {
    final List<UserEntity> users = [];
    await fireStore
        .collection(collection)
        .where(
          'email',
          isGreaterThanOrEqualTo: searchQuery,
          isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
              String.fromCharCode(
                searchQuery.codeUnitAt(searchQuery.length - 1) + 1,
              ),
        )
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          users.add(
            UserEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return users;
  }

  Future<UserEntity> fetchUser({
    required String collection,
    required String email,
  }) async {
    UserEntity user = await fireStore
        .collection(collection)
        .where('email', isEqualTo: email)
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        if (value.docs.isEmpty) {
          return UserEntity(
            email: '',
            uid: '',
            isAdmin: false,
            isSuperAdmin: false,
          );
        }
        return UserEntity.fromJson(
          value.docs.first.data(),
        );
      },
    );

    return user;
  }

  Future<CartEntity> fetchCart({
    required String collection,
    required String userId,
  }) async {
    final Map<String, dynamic>? cartJson = await fireStore
        .collection(collection)
        .doc(userId)
        .get()
        .then((value) => value.data());
    if (cartJson == null) {
      return CartEntity(
        cartItems: [],
        cost: 0,
        date: '',
        id: 0,
      );
    }

    return CartEntity.fromJson(cartJson);
  }

  Future<OrderHistoryEntity> fetchOrderHistory({
    required String collection,
    required String userId,
  }) async {
    final Map<String, dynamic>? ordersJson = await fireStore
        .collection(collection)
        .doc(userId)
        .get()
        .then((value) => value.data());
    if (ordersJson == null) {
      return OrderHistoryEntity(
        carts: [],
        email: '',
      );
    }

    return OrderHistoryEntity.fromJson(ordersJson);
  }

  Future<List<OrderHistoryEntity>> fetchAllUsersOrderHistory(
    String collection,
  ) async {
    final List<OrderHistoryEntity> orders = [];
    await fireStore.collection(collection).get().then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          orders.add(
            OrderHistoryEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return orders;
  }

  Future<List<OrderHistoryEntity>> fetchSearchedUsersOrderHistory({
    required String collection,
    required String searchQuery,
  }) async {
    final List<OrderHistoryEntity> orders = [];
    await fireStore
        .collection(collection)
        .where(
          'email',
          isGreaterThanOrEqualTo: searchQuery,
          isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
              String.fromCharCode(
                searchQuery.codeUnitAt(searchQuery.length - 1) + 1,
              ),
        )
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          orders.add(
            OrderHistoryEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return orders;
  }

  Future<List<DishEntity>> fetchNextDishes({
    required String collection,
    required int limit,
  }) async {
    final List<DishEntity> dishes = [];
    await fireStore
        .collection(collection)
        .orderBy('type')
        .startAfterDocument(_lastVisible)
        .limit(limit)
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        _lastVisible = value.docs[value.size - 1];
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          dishes.add(
            DishEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return dishes;
  }

  Future<List<DishEntity>> fetchAllDishesByType({
    required String collection,
    required String type,
  }) async {
    final List<DishEntity> dishes = [];
    await fireStore
        .collection(collection)
        .where(
          'type',
          isEqualTo: type,
        )
        .get()
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          dishes.add(
            DishEntity.fromJson(
              result.data(),
            ),
          );
        }
      },
    );

    return dishes;
  }
}
