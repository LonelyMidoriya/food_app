import 'package:core/core.dart';

class FirestoreProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getOne(
    String name,
    String collection,
  ) async {
    return fireStore
        .collection(collection)
        .where(
          'name',
          isEqualTo: name,
        )
        .get();
  }

  Future<void> updateCart(
    Map<String, dynamic> cart,
    String collection,
    String userId,
  ) async {
    await fireStore.collection(collection).doc(userId).set(cart);
  }

  Future<void> updateOrderHistory(
    Map<String, dynamic> orders,
    String collection,
    String userId,
  ) async {
    await fireStore.collection(collection).doc(userId).set(orders);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFirstDocs(
    String collection,
    int limit,
  ) async {
    return await fireStore
        .collection(collection)
        .orderBy('type')
        .limit(limit)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getCart(
    String collection,
    String userId,
  ) async {
    return await fireStore.collection(collection).doc(userId).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getOrderHistory(
    String collection,
    String userId,
  ) async {
    return await fireStore.collection(collection).doc(userId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNextDocs(
    String collection,
    int limit,
    QueryDocumentSnapshot<Map<String, dynamic>> lastVisible,
  ) async {
    return await fireStore
        .collection(collection)
        .orderBy('type')
        .startAfterDocument(lastVisible)
        .limit(limit)
        .get();
  }

  Future getAllByType(
    String collection,
    String type,
  ) async {
    return fireStore
        .collection(collection)
        .where(
          'type',
          isEqualTo: type,
        )
        .get();
  }
}
