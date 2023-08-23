import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'DishModel',
    () {
      test(
        'Empty DishModel should be a DishModel subclass',
            () {
          expect(DishModel.empty(), isA<DishModel>());
        },
      );

      test(
        'Empty cost value should be 0',
        () {
          expect(DishModel.empty().cost, 0);
        },
      );

      test(
        'CopyWith value should be set',
        () {
          DishModel dish = DishModel.empty().copyWith(cost: 22);

          expect(dish.cost, 22);
        },
      );
    },
  );

  group(
    'DishMapper',
    () {
      late DishModel model;
      late DishEntity entity;

      setUpAll(
        () {
          entity = DishEntity(
            name: 'Cheeseburger',
            imageUrl: '123',
            cost: 2,
            type: 'burger',
            description: 'asd',
            stats: {
              'kcal': 12,
              'fats': 23,
              'carbohydrates': 34,
              'proteins': 45,
            },
          );
          model = const DishModel(
            name: 'Cheeseburger',
            imageUrl: '123',
            cost: 2,
            type: 'burger',
            description: 'asd',
            stats: {
              'kcal': 12,
              'fats': 23,
              'carbohydrates': 34,
              'proteins': 45,
            },
          );
        },
      );

      test(
        'DishMapper should transform DishEntity to DishModel',
        () {
          DishMapper mapper = DishMapper();
          expect(mapper.toModel(entity).type, model.type);
          expect(mapper.toModel(entity).name, model.name);
          expect(mapper.toModel(entity).stats, model.stats);
          expect(mapper.toModel(entity).description, model.description);
          expect(mapper.toModel(entity).imageUrl, model.imageUrl);
          expect(mapper.toModel(entity).cost, model.cost);
        },
      );

      test(
        'DishMapper should transform DishModel to DishEntity',
        () {
          DishMapper mapper = DishMapper();
          expect(mapper.toEntity(model).type, entity.type);
          expect(mapper.toEntity(model).name, entity.name);
          expect(mapper.toEntity(model).stats, entity.stats);
          expect(mapper.toEntity(model).description, entity.description);
          expect(mapper.toEntity(model).imageUrl, entity.imageUrl);
          expect(mapper.toEntity(model).cost, entity.cost);
        },
      );
    },
  );

  group(
    'SettingsRepository',
    () {
      late SettingsRepositoryImpl settingsRepository;

      setUpAll(
        () async {
          SharedPreferences.setMockInitialValues(
            {"textSize": 18.0},
          );
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          settingsRepository =
              SettingsRepositoryImpl(sharedPreferences: sharedPreferences);
        },
      );

      test(
        'GetTextSize should return textSize',
        () async {
          expect(await settingsRepository.getTextSize(), 18.0);
        },
      );

      test(
        'SaveTextSize should change textSize',
            () async {
          await settingsRepository.saveTextSize(textSize: 22);
          expect(await settingsRepository.getTextSize(), 22.0);
        },
      );
    },
  );
}
