import 'package:cart_view/cart_view.dart';
import 'package:order_history_view/order_history_view.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:dishes_view/src/widget/type_list_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../bloc/bloc.dart';
import '../widget/dish_grid_item.dart';

class DishesViewScreen extends StatefulWidget {
  const DishesViewScreen({Key? key}) : super(key: key);

  @override
  State<DishesViewScreen> createState() => _DishesViewScreenState();
}

class _DishesViewScreenState extends State<DishesViewScreen> {
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
                    } else if (state.isLoaded) {
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
                            onTap: () =>
                                BlocProvider.of<DishesViewBloc>(context).add(
                              NavigateToDetailsEvent(
                                context: context,
                                model: state.dishes[index],
                              ),
                            ),
                            child: DishGridItem(
                              dish: state.dishes[index],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: AppButtonWidget(
                          label: 'load'.trim(),
                          onTap: () {
                            BlocProvider.of<DishesViewBloc>(context).add(
                              InitDishesEvent(),
                            );
                          },
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
