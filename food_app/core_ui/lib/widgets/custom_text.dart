import 'package:core/core.dart';
import 'package:settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext _, SettingsViewState state) {
        return Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: state.fontSize,
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
