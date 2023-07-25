part of 'bloc.dart';

abstract class SettingsViewEvent {}

class InitEvent extends SettingsViewEvent {}

class ChangeTextSizeEvent extends SettingsViewEvent {
  final double textSize;

  ChangeTextSizeEvent({
    required this.textSize,
  });
}
