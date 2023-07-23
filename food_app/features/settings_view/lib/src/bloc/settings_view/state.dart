part of 'bloc.dart';

class SettingsViewState {
  final double fontSize;

  SettingsViewState({
    required this.fontSize,
  });

  SettingsViewState.empty() : fontSize = 18;

  SettingsViewState copyWith({
    double? fontSize,
  }) =>
      SettingsViewState(
        fontSize: fontSize ?? this.fontSize,
      );
}
