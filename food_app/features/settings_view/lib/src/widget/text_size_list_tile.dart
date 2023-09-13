import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TextSizeListTile extends StatelessWidget {
  const TextSizeListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsViewBloc settingsViewBloc =
        BlocProvider.of<SettingsViewBloc>(context);

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
          clipBehavior: Clip.antiAliasWithSaveLayer,
          collapsedBackgroundColor: theme.colorScheme.primary,
          iconColor: theme.colorScheme.tertiary,
          collapsedIconColor: theme.colorScheme.tertiary,
          leading: const Icon(
            Icons.text_fields,
          ),
          title: Row(
            children: <Widget>[
              const Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: 'Text size',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CustomText(
                text: '${state.fontSize.toInt()}',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          children: <Widget>[
            ListTile(
              title: const CustomText(
                text: 'Small',
                fontWeight: FontWeight.w500,
              ),
              trailing: 14 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                settingsViewBloc.add(
                  const ChangeTextSizeEvent(textSize: 14),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Medium',
                fontWeight: FontWeight.w500,
              ),
              trailing: 18 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                settingsViewBloc.add(
                  const ChangeTextSizeEvent(textSize: 18),
                );
              },
            ),
            ListTile(
              title: const CustomText(
                text: 'Large',
                fontWeight: FontWeight.w500,
              ),
              trailing: 22 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                settingsViewBloc.add(
                  const ChangeTextSizeEvent(textSize: 22),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
