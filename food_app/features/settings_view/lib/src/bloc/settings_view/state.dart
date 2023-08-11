part of 'bloc.dart';

class SettingsViewState {
  final double fontSize;

  const SettingsViewState({
    required this.fontSize,
  });

  const SettingsViewState.empty() : fontSize = 18;

  SettingsViewState copyWith({
    double? fontSize,
  }) =>
      SettingsViewState(
        fontSize: fontSize ?? this.fontSize,
      );
}
