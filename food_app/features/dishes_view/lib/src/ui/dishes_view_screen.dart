import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/grid_item.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../bloc/bloc.dart';

class DishesViewPage extends StatelessWidget {
  const DishesViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DishesViewBloc>(
      create: (_) => DishesViewBloc(dishesUseCase: i.get<DishesUseCase>())
        ,
      child: const DishesViewScreen(),
    );
  }
}

class DishesViewScreen extends StatefulWidget {
  const DishesViewScreen({Key? key}) : super(key: key);

  @override
  State<DishesViewScreen> createState() => _DishesViewScreenState();
}

class _DishesViewScreenState extends State<DishesViewScreen> {
  late final ScrollController _scrollController;
  List<DishModel> dishes = [];
  bool isLastPage = false;
  final double position = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DishesViewBloc>(context).add(
      InitEvent(),
    );
    isLastPage = BlocProvider.of<DishesViewBloc>(context).isLastPage;
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll && !isLastPage) {
      BlocProvider.of<DishesViewBloc>(context).add(
        LoadEvent(),
      );
    }
  }

  Future<void> _onRefresh() async {
    isLastPage = false;
    BlocProvider.of<DishesViewBloc>(context).add(
      InitEvent(),
    );
    dishes = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffe7e7e7),
        body: BlocBuilder<DishesViewBloc, DishesViewState>(
          builder: (BuildContext context, DishesViewState state) {
            if (state is ErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if (state is LoadingState) {
              return const AppLoaderCenterWidget();
            }
            if (state is EmptyState) {
              return Center(
                child: AppButtonWidget(
                  label: 'load'.trim(),
                  onTap: () {
                    BlocProvider.of<DishesViewBloc>(context).add(
                      LoadEvent(),
                    );
                  },
                ),
              );
            }
            if (state is LoadedState) {
              //_scrollController.jumpTo(position);
              if (state.isLastPage) {
                isLastPage = true;
              }
              dishes = [...dishes, ...state.dishes];
              return LiquidPullToRefresh(
                onRefresh:  _onRefresh,
                child: GridView.builder(
                  controller: _scrollController,
                  key: const PageStorageKey<String>('items'),
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/3,
                  ),
                  itemCount: dishes.length,
                  itemBuilder: (context, index) => GridItem(dishes[index]),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
