import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TypeListTile extends StatelessWidget {
  final bool isSelected;
  final String type;

  const TypeListTile({
    Key? key,
    required this.isSelected,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext context, SettingsViewState state) {
        return SizedBox(
          width: state.fontSize * 6,
          child: ListTile(
            selected: isSelected,
            selectedTileColor: theme.colorScheme.primary,
            title: CustomText(
              text: type,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
