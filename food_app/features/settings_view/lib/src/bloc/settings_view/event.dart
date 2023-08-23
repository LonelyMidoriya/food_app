part of 'bloc.dart';

abstract class SettingsViewEvent {}

class GetTextSizeEvent implements SettingsViewEvent {}

class ChangeTextSizeEvent implements SettingsViewEvent {
  final double textSize;

  const ChangeTextSizeEvent({
    required this.textSize,
  });
}
