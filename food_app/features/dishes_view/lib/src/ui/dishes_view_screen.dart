import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dishes_view/src/widget/type_list_view.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

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
    final DishesViewBloc dishesViewBloc =
        BlocProvider.of<DishesViewBloc>(context);

    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll && !dishesViewBloc.state.isLastPage) {
      if (dishesViewBloc.state.hasInternet) {
        dishesViewBloc.add(
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
    final DishesViewBloc dishesViewBloc =
        BlocProvider.of<DishesViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

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
                    } else if (state.dishes.isEmpty) {
                      return const Center(
                        child: CustomText(
                          text: 'Nothing here',
                          fontWeight: FontWeight.w500,
                        ),
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
                            onTap: () => authViewBloc.add(
                              NavigateToPageEvent(
                                route: DishDescriptionPageRoute(
                                  dish: state.dishes[index],
                                ),
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
                          label: 'load',
                          onTap: () {
                            dishesViewBloc.add(
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
