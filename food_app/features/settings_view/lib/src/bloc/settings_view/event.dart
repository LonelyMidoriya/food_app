part of 'bloc.dart';

abstract class SettingsViewEvent {}

class InitEvent implements SettingsViewEvent {}

class ChangeTextSizeEvent implements SettingsViewEvent {
  final double textSize;

  const ChangeTextSizeEvent({
    required this.textSize,
  });
}
