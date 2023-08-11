import 'package:core/core.dart';
import 'package:dishes_view/src/widget/type_list_tile.dart';
import 'package:flutter/cupertino.dart';

import '../../dishes_view.dart';

class TypeListView extends StatelessWidget {
  const TypeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: BlocBuilder<DishesViewBloc, DishesViewState>(
        builder: (BuildContext context, DishesViewState state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: TypeOfFood.values.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                BlocProvider.of<DishesViewBloc>(context).add(
                  LoadDishesByTypeEvent(
                    type: TypeOfFood.values[index].toString().split('.').last,
                    selectedType: index,
                  ),
                );
              },
              child: TypeListTile(
                isSelected: state.selectedType == index,
                type: TypeOfFood.values[index].toString().split('.').last,
              ),
            ),
          );
        },
      ),
    );
  }
}
