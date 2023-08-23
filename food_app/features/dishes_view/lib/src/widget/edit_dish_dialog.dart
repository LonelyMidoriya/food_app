import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class EditDishDialog extends StatefulWidget {
  final DishModel _dish;
  const EditDishDialog({
    Key? key,
    required DishModel dish,
  })  : _dish = dish,
        super(key: key);

  @override
  State<EditDishDialog> createState() => _EditDishDialogState();
}

class _EditDishDialogState extends State<EditDishDialog> {
  final TextEditingController dropDownController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController kcalController = TextEditingController();
  final TextEditingController carbohydratesController = TextEditingController();
  final TextEditingController fatsController = TextEditingController();
  final TextEditingController proteinsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dropDownController.text = widget._dish.type;
    nameController.text = widget._dish.name;
    costController.text = widget._dish.cost.toStringAsFixed(2);
    descriptionController.text = widget._dish.description;
    imageController.text = widget._dish.imageUrl;
    kcalController.text = widget._dish.stats['kcal'].toString();
    carbohydratesController.text =
        widget._dish.stats['carbohydrates'].toString();
    fatsController.text = widget._dish.stats['fats'].toString();
    proteinsController.text = widget._dish.stats['proteins'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return AlertDialog(
      insetPadding: EdgeInsets.only(
        top: size.height / 20,
        bottom: size.height / 20,
        right: size.width / 20,
        left: size.width / 20,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: SizedBox(
        height: size.height / 30,
        width: size.width / 1.5,
        child: const CustomText(
          text: 'Edit dish',
          fontWeight: FontWeight.w900,
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: textValidator,
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: textValidator,
                  controller: imageController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'image Url',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                TextFormField(
                  validator: textValidator,
                  maxLines: 3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'description',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  value: dropDownController.text,
                  items: TypeOfFood.values
                      .where((element) => element.name != 'all')
                      .toList()
                      .map<DropdownMenuItem<String>>(
                    (TypeOfFood e) {
                      return DropdownMenuItem<String>(
                        value: e.name,
                        child: Center(
                          child: SizedBox(
                            height: size.height / 15,
                            width: size.width / 2,
                            child: Center(
                              child: CustomText(
                                text: e.name,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    dropDownController.text = newValue!;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: textValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: costController,
                  decoration: const InputDecoration(
                    labelText: 'cost',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ...widget._dish.stats.keys.toList().map(
                  (e) {
                    return Column(
                      children: <Widget>[
                        TextFormField(
                          validator: textValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          controller: e == 'kcal'
                              ? kcalController
                              : e == 'fats'
                                  ? fatsController
                                  : e == 'carbohydrates'
                                      ? carbohydratesController
                                      : proteinsController,
                          decoration: InputDecoration(
                            labelText: e,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ).toList(),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                BlocProvider.of<DishesViewBloc>(context).add(
                  UpdateDishEvent(
                    newDish: DishModel(
                      name: nameController.text,
                      imageUrl: imageController.text,
                      cost: double.parse(costController.text),
                      type: dropDownController.text,
                      description: descriptionController.text,
                      stats: {
                        'kcal': int.parse(kcalController.text),
                        'fats': int.parse(fatsController.text),
                        'carbohydrates':
                            int.parse(carbohydratesController.text),
                        'proteins': int.parse(proteinsController.text),
                      },
                    ),
                    dish: widget._dish,
                  ),
                );
                if (BlocProvider.of<AuthViewBloc>(context)
                    .state
                    .user
                    .isSuperAdmin) {
                  appRouter.popUntilRouteWithName(SuperAdminHomePageRoute.name);
                } else {
                  appRouter.popUntilRouteWithName(AdminHomePageRoute.name);
                }
              }
            },
            child: const CustomText(
              text: 'Save',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () {
              appRouter.pop();
            },
            child: const CustomText(
              text: 'Cancel',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
