import 'package:domain/repository/settings_repository.dart';
import 'package:domain/usecases/usecase.dart';

class GetTextSizeUseCase implements FutureUseCase<NoParams, double?> {
  final SettingsRepository _settingsRepository;

  const GetTextSizeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<double?> execute(NoParams input) async {
    return _settingsRepository.getTextSize();
  }
}
