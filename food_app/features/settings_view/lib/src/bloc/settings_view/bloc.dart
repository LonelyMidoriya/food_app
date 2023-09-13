import 'package:core/core.dart';
import 'package:domain/usecases/fetch_text_size_usecase.dart';
import 'package:domain/usecases/save_text_size_usecase.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class SettingsViewBloc extends Bloc<SettingsViewEvent, SettingsViewState> {
  final FetchTextSizeUseCase _fetchTextSizeUseCase;
  final SaveTextSizeUseCase _saveTextSizeUseCase;

  SettingsViewBloc({
    required FetchTextSizeUseCase fetchTextSizeUseCase,
    required SaveTextSizeUseCase saveTextSizeUseCase,
  })  : _fetchTextSizeUseCase = fetchTextSizeUseCase,
        _saveTextSizeUseCase = saveTextSizeUseCase,
        super(
          const SettingsViewState.empty(),
        ) {
    on<GetTextSizeEvent>(_init);
    on<ChangeTextSizeEvent>(_changeTextSize);
  }

  Future<void> _init(GetTextSizeEvent event, Emitter<SettingsViewState> emit) async {
    final double? textSize =
        await _fetchTextSizeUseCase.execute(const NoParams());
    emit(
      state.copyWith(fontSize: textSize),
    );
  }

  Future<void> _changeTextSize(
      ChangeTextSizeEvent event, Emitter<SettingsViewState> emit) async {
    await _saveTextSizeUseCase.execute(event.textSize);

    emit(
      state.copyWith(fontSize: event.textSize),
    );
  }
}
