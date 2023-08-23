import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import '../../dishes_view.dart';

class AddDishDialog extends StatefulWidget {
  const AddDishDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDishDialog> createState() => _AddDishDialogState();
}

class _AddDishDialogState extends State<AddDishDialog> {
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
    dropDownController.text = 'burger';
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
          text: 'Add dish',
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
                  controller: nameController,
                  validator: textValidator,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    labelText: 'name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: imageController,
                  validator: textValidator,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    labelText: 'image Url',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 3,
                  validator: textValidator,
                  controller: descriptionController,
                  autovalidateMode: AutovalidateMode.always,
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
                  keyboardType: TextInputType.number,
                  controller: costController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    labelText: 'cost',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ...DishModel.empty().stats.keys.toList().map(
                  (e) {
                    _formKey.currentState?.validate();
                    return Column(
                      children: <Widget>[
                        TextFormField(
                          validator: textValidator,
                          autovalidateMode: AutovalidateMode.always,
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
                  AddDishEvent(
                    dish: DishModel(
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
                  ),
                );
                appRouter.pop();
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
