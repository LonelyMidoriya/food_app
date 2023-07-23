abstract class SettingsRepository {
  Future<double?> getTextSize();
  Future<void> saveTextSize(double textSize);
}
