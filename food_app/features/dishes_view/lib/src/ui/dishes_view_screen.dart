import 'package:core/consts/dishes_states.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../bloc/bloc.dart';

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
      BlocProvider.of<DishesViewBloc>(context).add(
        LoadEvent(),
      );
    }
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<DishesViewBloc>(context).state.isLastPage = false;
    BlocProvider.of<DishesViewBloc>(context).add(
      InitEvent(),
    );
    BlocProvider.of<DishesViewBloc>(context).state.dishes = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffe7e7e7),
        body: BlocBuilder<DishesViewBloc, DishesViewState>(
          builder: (BuildContext context, DishesViewState state) {
            if (state.status == DishesStates.ERROR) {
              return Center(
                child: Text(state.errorMessage.toString()),
              );
            }
            if (state.status == DishesStates.LOADING) {
              return const AppLoaderCenterWidget();
            }
            if (state.status == DishesStates.EMPTY) {
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
            if (state.status == DishesStates.LOADED) {
              return LiquidPullToRefresh(
                onRefresh: _onRefresh,
                child: GridView.builder(
                  controller: _scrollController,
                  key: const PageStorageKey<String>('items'),
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: state.dishes.length,
                  itemBuilder: (context, index) =>
                      GridItem(state.dishes[index]),
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
