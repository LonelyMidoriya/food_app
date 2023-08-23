import 'package:core/core.dart';
import 'package:settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String _text;
  final FontWeight _fontWeight;
  final Color _textColor;
  final TextAlign _textAlign;

  const CustomText({
    super.key,
    required String text,
    required FontWeight fontWeight,
    Color textColor = Colors.transparent,
    TextAlign textAlign = TextAlign.center,
  })  : _textColor = textColor,
        _fontWeight = fontWeight,
        _textAlign = textAlign,
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
            child: AutoSizeText(
              _text,
              textAlign: _textAlign,
              maxLines: 2,
            ),
          ),
        );
      },
    );
  }
}
