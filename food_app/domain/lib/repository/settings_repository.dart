abstract class SettingsRepository {
  Future<double?> getTextSize();
  Future<void> saveTextSize({required double textSize});
}
