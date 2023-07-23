import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../settings_view.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
        builder: (BuildContext context, SettingsViewState state) {
      return ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: theme.colorScheme.primary,
        clipBehavior: Clip.antiAlias,
        collapsedBackgroundColor: theme.colorScheme.primary,
        leading: const Icon(
          Icons.dark_mode,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Theme Mode',
                style: TextStyle(fontSize: state.fontSize),
              ),
            ),
            Text(
              AdaptiveTheme.of(context).mode.modeName,
              style: TextStyle(fontSize: state.fontSize),
            ),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              'System',
              style: TextStyle(fontSize: state.fontSize),
            ),
            trailing: AdaptiveTheme.of(context).mode.isSystem
                ? const Icon(
                    Icons.check_circle_rounded,
                  )
                : null,
            onTap: () {
              AdaptiveTheme.of(context).setSystem();
            },
          ),
          ListTile(
            title: Text(
              'Light',
              style: TextStyle(fontSize: state.fontSize),
            ),
            trailing: AdaptiveTheme.of(context).mode.isLight
                ? const Icon(
                    Icons.check_circle_rounded,
                  )
                : null,
            onTap: () {
              AdaptiveTheme.of(context).setLight();
            },
          ),
          ListTile(
            title: Text(
              'Dark',
              style: TextStyle(fontSize: state.fontSize),
            ),
            trailing: AdaptiveTheme.of(context).mode.isDark
                ? const Icon(
                    Icons.check_circle_rounded,
                  )
                : null,
            onTap: () {
              AdaptiveTheme.of(context).setDark();
            },
          ),
        ],
      );
    });
  }
}
