import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TypeListTile extends StatelessWidget {
  final bool _isSelected;
  final String _type;

  const TypeListTile({
    Key? key,
    required bool isSelected,
    required String type,
  })  : _type = type,
        _isSelected = isSelected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext context, SettingsViewState state) {
        return SizedBox(
          width: state.fontSize * 6,
          child: ListTile(
            selected: _isSelected,
            selectedTileColor: theme.colorScheme.primary,
            title: CustomText(
              text: _type,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
