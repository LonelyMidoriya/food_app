import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:dishes_view/src/widget/add_dish_dialog.dart';
import 'package:dishes_view/src/widget/type_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

import '../bloc/bloc.dart';
import '../widget/admin_dish_grid_item.dart';

class AdminDishesViewScreen extends StatefulWidget {
  const AdminDishesViewScreen({Key? key}) : super(key: key);

  @override
  State<AdminDishesViewScreen> createState() => _AdminDishesViewScreenState();
}

class _AdminDishesViewScreenState extends State<AdminDishesViewScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll &&
        !BlocProvider.of<DishesViewBloc>(context).state.isLastPage) {
      if (BlocProvider.of<DishesViewBloc>(context).state.hasInternet) {
        BlocProvider.of<DishesViewBloc>(context).add(
          LoadDishesEvent(),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<DishesViewBloc>(context).add(
      InitDishesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: ElevatedButton(
            onPressed: () {
              showAnimatedDialog(
                animationType: DialogTransitionType.fadeScale,
                duration: const Duration(milliseconds: 500),
                context: context,
                builder: (BuildContext context) {
                  return AddDishDialog();
                },
              );
            },
            child: const Icon(CupertinoIcons.plus),
          ),
          backgroundColor: theme.colorScheme.background,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TypeListView(),
              Expanded(
                child: BlocBuilder<DishesViewBloc, DishesViewState>(
                  builder: (BuildContext context, DishesViewState state) {
                    if (!state.isError && !state.isLoaded) {
                      return const AppLoaderCenterWidget();
                    } else if (state.isError) {
                      return Center(
                        child: Text(state.errorMessage.toString()),
                      );
                    } else if (state.isLoaded && state.hasInternet) {
                      return LiquidPullToRefresh(
                        color: theme.colorScheme.primary,
                        onRefresh: _onRefresh,
                        child: GridView.builder(
                          controller: _scrollController,
                          key: const PageStorageKey<String>('items'),
                          addAutomaticKeepAlives: false,
                          addRepaintBoundaries: false,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                          ),
                          itemCount: state.dishes.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => appRouter.navigate(
                              AdminDishDescriptionPageRoute(
                                dish: state.dishes[index],
                              ),
                            ),
                            child: AdminDishGridItem(
                              dish: state.dishes[index],
                            ),
                          ),
                        ),
                      );
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
                                BlocProvider.of<DishesViewBloc>(context).add(
                                  InitDishesEvent(),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
