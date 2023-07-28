import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../settings_view.dart';

class TextSizeListTile extends StatelessWidget {
  const TextSizeListTile({Key? key}) : super(key: key);

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
            Icons.text_fields,
          ),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Text size',
                  style: TextStyle(fontSize: state.fontSize),
                ),
              ),
              Text(
                '${state.fontSize}',
                style: TextStyle(fontSize: state.fontSize),
              ),
            ],
          ),
          children: <Widget>[
            ListTile(
              title: const Text(
                'Small',
                style: TextStyle(fontSize: 14),
              ),
              trailing: 14 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                BlocProvider.of<SettingsViewBloc>(context).add(
                  ChangeTextSizeEvent(textSize: 14),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Medium',
                style: TextStyle(fontSize: 18),
              ),
              trailing: 18 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                BlocProvider.of<SettingsViewBloc>(context).add(
                  ChangeTextSizeEvent(textSize: 18),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Large',
                style: TextStyle(fontSize: 22),
              ),
              trailing: 22 == state.fontSize
                  ? const Icon(
                      Icons.check_circle_rounded,
                    )
                  : null,
              onTap: () {
                BlocProvider.of<SettingsViewBloc>(context).add(
                  ChangeTextSizeEvent(textSize: 22),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
