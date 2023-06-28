import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreProvider{
  Future getOne(String name, String collection);
  Future<QuerySnapshot<Map<String, dynamic>>> getAllDocs(String collection, int limit,lastVisible );
  Future getAllByType(String collection,int limit,String type);
  Future<QuerySnapshot<Map<String, dynamic>>> getFirstDocs(String collection,int limit);
}

class FirestoreProviderImpl implements FirestoreProvider{
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future getOne(String name, String collection) async {
    return _fireStore.collection(collection).where("name", isEqualTo: name).get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFirstDocs(String collection,int limit) async {
      return await _fireStore.collection(collection).orderBy('type').limit(limit).get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllDocs(String collection,int limit, lastVisible) async {
    return await _fireStore.collection(collection).orderBy('type').startAfterDocument(lastVisible).limit(limit).get();
  }

  @override
  Future getAllByType(String collection,int limit,String type) async {
    return _fireStore.collection(collection).where("type", isEqualTo: type).limit(limit).get();
  }

}