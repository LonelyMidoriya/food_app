import 'package:core/consts/consts.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../settings_view.dart';

class AboutUsTile extends StatelessWidget {
  const AboutUsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Uri uri = Uri.parse(url);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext context, SettingsViewState state) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          leading: const Icon(
            Icons.link,
          ),
          tileColor: theme.colorScheme.primary,
          title: Text(
            'About Us',
            style: TextStyle(fontSize: state.fontSize),
          ),
          onTap: () async {
            await launchUrl(
              uri,
              mode: LaunchMode.platformDefault,
            );
          },
        );
      },
    );
  }
}
