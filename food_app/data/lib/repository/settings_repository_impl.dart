import 'package:core/core.dart';
import 'package:domain/repository/settings_repository.dart';


class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _sharedPreferences;

  SettingsRepositoryImpl(this._sharedPreferences);

  @override
  Future<double?> getTextSize() async {
    final double? textSize =  await _sharedPreferences.getDouble('textSize');
    return textSize;
  }

  @override
  Future<void> saveTextSize(double textSize) async {
    await _sharedPreferences.setDouble('textSize', textSize);
  }
}
