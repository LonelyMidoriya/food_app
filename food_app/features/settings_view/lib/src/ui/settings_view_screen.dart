import 'package:flutter/material.dart';
import 'package:settings_view/src/widget/about_us_tile.dart';
import 'package:settings_view/src/widget/text_size_list_tile.dart';
import 'package:settings_view/src/widget/theme_list_tile.dart';

class SettingsViewScreen extends StatelessWidget {
  const SettingsViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            children: const <Widget>[
              ThemeListTile(),
              Divider(),
              TextSizeListTile(),
              Divider(),
              AboutUsTile(),
            ],
          ),
        ),
      ),
    );
  }
}
