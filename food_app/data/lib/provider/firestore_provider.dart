import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/di/app_di.dart';

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
    int userId,
  ) async {
    await fireStore.collection(collection).doc('$userId').set(cart);
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
    int userId,
  ) async {
    return await fireStore.collection(collection).doc('$userId').get();
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
    int limit,
    String type,
  ) async {
    return fireStore
        .collection(collection)
        .where(
          'type',
          isEqualTo: type,
        )
        .limit(limit)
        .get();
  }
}
