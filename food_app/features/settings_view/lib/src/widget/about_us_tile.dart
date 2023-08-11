import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsTile extends StatelessWidget {
  const AboutUsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Uri uri = Uri.parse(gitHubUrl);

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      leading: const Icon(
        Icons.link,
      ),
      tileColor: theme.colorScheme.primary,
      iconColor: theme.colorScheme.tertiary,
      title: const Align(
        alignment: Alignment.centerLeft,
        child: CustomText(
          text:'About Us',
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      },
    );
  }
}
