import 'package:core/di/data_di.dart';
import 'package:get_it/get_it.dart';

final AppDI appDI = AppDI();
final GetIt i = GetIt.instance;

class AppDI {
  void initDependencies() {
    DataDI().initDependencies();
  }
}
