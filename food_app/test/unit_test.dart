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
          expect(DishMapper.toModel(entity).type, model.type);
          expect(DishMapper.toModel(entity).name, model.name);
          expect(DishMapper.toModel(entity).stats, model.stats);
          expect(DishMapper.toModel(entity).description, model.description);
          expect(DishMapper.toModel(entity).imageUrl, model.imageUrl);
          expect(DishMapper.toModel(entity).cost, model.cost);
        },
      );

      test(
        'DishMapper should transform DishModel to DishEntity',
        () {
          expect(DishMapper.toEntity(model).type, entity.type);
          expect(DishMapper.toEntity(model).name, entity.name);
          expect(DishMapper.toEntity(model).stats, entity.stats);
          expect(DishMapper.toEntity(model).description, entity.description);
          expect(DishMapper.toEntity(model).imageUrl, entity.imageUrl);
          expect(DishMapper.toEntity(model).cost, entity.cost);
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
          expect(await settingsRepository.fetchTextSize(), 18.0);
        },
      );

      test(
        'SaveTextSize should change textSize',
        () async {
          await settingsRepository.saveTextSize(22);
          expect(await settingsRepository.fetchTextSize(), 22.0);
        },
      );
    },
  );
}
