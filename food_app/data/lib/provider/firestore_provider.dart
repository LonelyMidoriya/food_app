import 'package:core/core.dart';

class FirestoreProvider {
  final FirebaseFirestore fireStore;
  FirestoreProvider(this.fireStore);

  Future<QuerySnapshot<Map<String, dynamic>>> getOne({
    required String name,
    required String collection,
  }) async {
    return fireStore
        .collection(collection)
        .where(
          'name',
          isEqualTo: name,
        )
        .get();
  }

  Future<void> updateCart({
    required Map<String, dynamic> cart,
    required String collection,
    required String userId,
  }) async {
    await fireStore.collection(collection).doc(userId).set(cart);
  }

  Future<void> updateOrderHistory({
    required Map<String, dynamic> orders,
    required String collection,
    required String userId,
  }) async {
    await fireStore.collection(collection).doc(userId).set(orders);
  }

  Future<void> addUser({
    required Map<String, dynamic> user,
    required String collection,
  }) async {
    await fireStore.collection(collection).add(user);
  }

  Future<void> updateUser({
    required Map<String, dynamic> user,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldUser = await fireStore
        .collection(collection)
        .where('email', isEqualTo: user['email'])
        .get();

    await fireStore.collection(collection).doc(oldUser.docs.first.id).set(user);
  }

  Future<void> addDish({
    required Map<String, dynamic> dish,
    required String collection,
  }) async {
    await fireStore.collection(collection).add(dish);
  }

  Future<void> updateDish({
    required List<Map<String, dynamic>> dishes,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldDish = await fireStore
        .collection(collection)
        .where('name', isEqualTo: dishes[0]['name'])
        .get();
    await fireStore
        .collection(collection)
        .doc(oldDish.docs.first.id)
        .set(dishes[1]);
  }

  Future<void> deleteDish({
    required Map<String, dynamic> dish,
    required String collection,
  }) async {
    QuerySnapshot<Map<String, dynamic>> oldDish = await fireStore
        .collection(collection)
        .where('name', isEqualTo: dish['name'])
        .get();

    await fireStore.collection(collection).doc(oldDish.docs.first.id).delete();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFirstDocs({
    required String collection,
    required int limit,
  }) async {
    return await fireStore
        .collection(collection)
        .orderBy('type')
        .limit(limit)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUsers({
    required String collection,
  }) async {
    return await fireStore
        .collection(collection)
        .orderBy(
          'isAdmin',
          descending: true,
        )
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSearchedUsers({
    required String collection,
    required String searchQuery,
  }) async {
    return await fireStore
        .collection(collection)
        .where(
          'email',
          isGreaterThanOrEqualTo: searchQuery,
          isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
              String.fromCharCode(
                searchQuery.codeUnitAt(searchQuery.length - 1) + 1,
              ),
        )
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUser({
    required String collection,
    required String email,
  }) async {
    return await fireStore
        .collection(collection)
        .where('email', isEqualTo: email)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCart({
    required String collection,
    required String userId,
  }) async {
    return await fireStore.collection(collection).doc(userId).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getOrderHistory({
    required String collection,
    required String userId,
  }) async {
    return await fireStore.collection(collection).doc(userId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsersOrderHistory({
    required String collection,
  }) async {
    return await fireStore.collection(collection).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSearchedUsersOrderHistory({
    required String collection,
    required String searchQuery,
  }) async {
    return await fireStore
        .collection(collection)
        .where(
          'email',
          isGreaterThanOrEqualTo: searchQuery,
          isLessThan: searchQuery.substring(0, searchQuery.length - 1) +
              String.fromCharCode(
                searchQuery.codeUnitAt(searchQuery.length - 1) + 1,
              ),
        )
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNextDocs({
    required String collection,
    required int limit,
    required QueryDocumentSnapshot<Map<String, dynamic>> lastVisible,
  }) async {
    return await fireStore
        .collection(collection)
        .orderBy('type')
        .startAfterDocument(lastVisible)
        .limit(limit)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllByType({
    required String collection,
    required String type,
  }) async {
    return fireStore
        .collection(collection)
        .where(
          'type',
          isEqualTo: type,
        )
        .get();
  }
}
