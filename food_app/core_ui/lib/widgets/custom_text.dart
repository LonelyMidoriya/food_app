import 'package:core/core.dart';
import 'package:settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String _text;
  final FontWeight _fontWeight;
  final Color _textColor;

  const CustomText({
    super.key,
    required String text,
    required FontWeight fontWeight,
    Color textColor = Colors.transparent,
  })  : _textColor = textColor,
        _fontWeight = fontWeight,
        _text = text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext _, SettingsViewState state) {
        return AnimatedTheme(
          data: theme,
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontWeight: _fontWeight,
              fontSize: state.fontSize,
              color: _textColor == Colors.transparent
                  ? theme.colorScheme.tertiary
                  : _textColor,
            ),
            duration: const Duration(milliseconds: 400),
            child: Text(
              _text,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
