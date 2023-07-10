import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/di/app_di.dart';

class FirestoreProvider {
  Future getOne(
    String name,
    String collection,
  ) async {
    return fireStore
        .collection(collection)
        .where('name', isEqualTo: name)
        .get();
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

  Future<QuerySnapshot<Map<String, dynamic>>> getAllDocs(
    String collection,
    int limit,
    lastVisible,
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
