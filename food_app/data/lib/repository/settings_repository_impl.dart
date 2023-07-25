import 'package:domain/repository/settings_repository.dart';

import '../provider/hive_provider.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveProvider _hiveProvider;

  SettingsRepositoryImpl(this._hiveProvider);

  @override
  Future<double?> getTextSize() async {
    final double? textSize = await _hiveProvider.getTextSize();
    return textSize;
  }

  @override
  Future<void> saveTextSize(double textSize) async {
    await _hiveProvider.saveTextSize(textSize);
  }
}
