import 'package:admin_control_panel_view/src/bloc/admin_control_panel_bloc/bloc.dart';
import 'package:admin_control_panel_view/src/widget/user_item.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AdminControlPanelScreen extends StatefulWidget {
  const AdminControlPanelScreen({Key? key}) : super(key: key);

  @override
  State<AdminControlPanelScreen> createState() =>
      _AdminControlPanelScreenState();
}

class _AdminControlPanelScreenState extends State<AdminControlPanelScreen> {
  final TextEditingController textEditingController = TextEditingController();

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
          body: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 20),
                showCursor: false,
                onChanged: (String text) {
                  if (text != '') {
                    BlocProvider.of<AdminControlPanelBloc>(context).add(
                      GetSearchedUsersEvent(
                        searchQuery: textEditingController.text,
                      ),
                    );
                  } else {
                    BlocProvider.of<AdminControlPanelBloc>(context).add(
                      AdminControlPanelInitEvent(),
                    );
                  }
                },
                decoration: InputDecoration(
                  fillColor: theme.colorScheme.background,
                  hintText: 'Search for user',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                textInputAction: TextInputAction.search,
                enableInteractiveSelection: false,
                controller: textEditingController,
              ),
              Expanded(
                child: LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  onRefresh: () async {
                    if (textEditingController.text == '') {
                      BlocProvider.of<AdminControlPanelBloc>(context).add(
                        AdminControlPanelInitEvent(),
                      );
                    } else {
                      BlocProvider.of<AdminControlPanelBloc>(context).add(
                        GetSearchedUsersEvent(
                          searchQuery: textEditingController.text,
                        ),
                      );
                    }
                  },
                  color: theme.colorScheme.primary,
                  child: BlocBuilder<AdminControlPanelBloc,
                      AdminControlPanelState>(
                    builder:
                        (BuildContext context, AdminControlPanelState state) {
                      if (!state.isError &&
                          !state.isLoaded &&
                          state.hasInternet) {
                        return const AppLoaderCenterWidget();
                      } else if (state.isError && state.hasInternet) {
                        return Center(
                          child: Text(state.errorMessage.toString()),
                        );
                      } else if (state.isLoaded && state.hasInternet) {
                        if (state.users.isEmpty) {
                          return const Center(
                            child: CustomText(
                              text: 'No users found',
                              fontWeight: FontWeight.w900,
                            ),
                          );
                        } else {
                          return ListView.separated(
                            padding: const EdgeInsets.all(10),
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            itemCount: state.users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return UserItem(
                                user: state.users[index],
                                textEditingController: textEditingController,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          );
                        }
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Center(
                                child: CustomText(
                                  text: 'Internet connection lost.',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppButtonWidget(
                                label: 'Refresh'.trim(),
                                onTap: () {
                                  if (!state.hasInternet) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        elevation: 50,
                                        backgroundColor: Colors.teal,
                                        content: CustomText(
                                          text: 'No Internet connection!',
                                          fontWeight: FontWeight.w800,
                                          textColor: theme.colorScheme.tertiary,
                                        ),
                                        duration: const Duration(seconds: 2),
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 60,
                                          horizontal: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  BlocProvider.of<AdminControlPanelBloc>(
                                          context)
                                      .add(
                                    AdminControlPanelInitEvent(),
                                  );
                                  textEditingController.clear();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
