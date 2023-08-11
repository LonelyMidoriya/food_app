import 'package:core/core.dart';
import 'package:settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color? textColor;

  const CustomText({
    super.key,
    required this.text,
    required this.fontWeight,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext _, SettingsViewState state) {
        return AnimatedTheme(
          data: theme,
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: state.fontSize,
              color: textColor ?? theme.colorScheme.tertiary,
            ),
            duration: const Duration(milliseconds: 400),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
