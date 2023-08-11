import 'package:core/core.dart';

class FirestoreProvider {
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
