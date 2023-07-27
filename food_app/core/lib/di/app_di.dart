import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/di/data_di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/routes/app_router.dart';

import '../config/firebase_options.dart';

final AppDI appDI = AppDI();
final AppRouter appRouter = AppRouter();
final GetIt appLocator = GetIt.instance;
final FirebaseFirestore fireStore = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class AppDI {
  Future<void> initDependencies() async {
    DataDI().initDependencies();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
