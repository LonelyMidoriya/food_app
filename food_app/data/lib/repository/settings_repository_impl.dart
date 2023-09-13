import 'package:core/core.dart';
import 'package:domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _sharedPreferences;

  const SettingsRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<double?> fetchTextSize() async {
    final double? textSize = _sharedPreferences.getDouble('textSize');
    return textSize;
  }

  @override
  Future<void> saveTextSize(double textSize) async {
    await _sharedPreferences.setDouble('textSize', textSize);
  }
}
