import 'package:core/core.dart';
import 'package:domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences sharedPreferences;

  SettingsRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  Future<double?> getTextSize() async {
    final double? textSize = await sharedPreferences.getDouble('textSize');
    return textSize;
  }

  @override
  Future<void> saveTextSize({required double textSize}) async {
    await sharedPreferences.setDouble('textSize', textSize);
  }
}
