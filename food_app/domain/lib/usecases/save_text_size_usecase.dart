import 'package:domain/usecases/usecase.dart';

import '../repository/settings_repository.dart';

class SaveTextSizeUseCase implements FutureUseCase<double, void> {
  final SettingsRepository _settingsRepository;

  const SaveTextSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(double input) async {
    _settingsRepository.saveTextSize(input);
  }
}
