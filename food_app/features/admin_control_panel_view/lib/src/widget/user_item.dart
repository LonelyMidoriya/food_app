import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class UserItem extends StatelessWidget {
  final UserModel _user;
  final TextEditingController textEditingController;

  const UserItem({
    required UserModel user,
    required this.textEditingController,
    super.key,
  }) : _user = user;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminControlPanelBloc adminControlPanelBloc =
        BlocProvider.of<AdminControlPanelBloc>(context);

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      tileColor: theme.colorScheme.primary,
      iconColor: theme.colorScheme.tertiary,
      title: CustomText(
        text: _user.email,
        fontWeight: FontWeight.w500,
      ),
      leading: _user.isAdmin
          ? const Icon(
              Icons.admin_panel_settings,
            )
          : const SizedBox(),
      trailing: _user.isAdmin
          ? _user.isSuperAdmin
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    adminControlPanelBloc.add(
                      TakeAdminRightsEvent(user: _user),
                    );
                  },
                  icon: const Icon(Icons.cancel_outlined),
                )
          : IconButton(
              onPressed: () {
                adminControlPanelBloc.add(
                  GiveAdminRightsEvent(user: _user),
                );
              },
              icon: const Icon(Icons.check_circle_outline),
            ),
    );
  }
}
