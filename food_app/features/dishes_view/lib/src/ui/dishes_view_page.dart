import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import '../bloc/bloc.dart';
import 'dishes_view_screen.dart';

class DishesViewPage extends StatelessWidget {
  const DishesViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DishesViewBloc>(
      create: (_) => DishesViewBloc(
        getInitDishesUseCase: appLocator.get<GetInitDishesUseCase>(),
        getNextDishesUseCase: appLocator.get<GetNextDishesUseCase>(),
      )..add(
          InitEvent(),
        ),
      child: const DishesViewScreen(),
    );
  }
}
