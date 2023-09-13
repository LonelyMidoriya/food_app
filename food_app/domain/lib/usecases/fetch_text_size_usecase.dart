import 'package:domain/repository/settings_repository.dart';
import 'package:domain/usecases/usecase.dart';

class FetchTextSizeUseCase implements FutureUseCase<NoParams, double?> {
  final SettingsRepository _settingsRepository;

  const FetchTextSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<double?> execute(NoParams input) async {
    return _settingsRepository.fetchTextSize();
  }
}
