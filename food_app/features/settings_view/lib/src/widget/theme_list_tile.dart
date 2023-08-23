import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: theme.colorScheme.primary,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      collapsedBackgroundColor: theme.colorScheme.primary,
      iconColor: theme.colorScheme.tertiary,
      collapsedIconColor: theme.colorScheme.tertiary.withOpacity(0.8),
      leading: const Icon(
        Icons.dark_mode,
      ),
      title: Row(
        children: <Widget>[
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: 'Theme Mode',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomText(
            text: AdaptiveTheme.of(context).mode.modeName,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: const CustomText(
            text: 'System',
            fontWeight: FontWeight.w500,
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
          title: const CustomText(
            text: 'Light',
            fontWeight: FontWeight.w500,
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
          title: const CustomText(
            text: 'Dark',
            fontWeight: FontWeight.w500,
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
  }
}
