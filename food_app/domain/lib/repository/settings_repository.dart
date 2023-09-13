abstract class SettingsRepository {
  Future<double?> fetchTextSize();

  Future<void> saveTextSize(double textSize);
}
