import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_ui/core_ui.dart';
import 'mock.dart';

Future<void> main() async {
  late SettingsViewBloc settingsBloc;

  setUpAll(
    () async {
      SharedPreferences.setMockInitialValues(
        {"textSize": 18},
      );
      settingsBloc = SettingsViewBloc(
        fetchTextSizeUseCase: GetTextSizeUseCaseMock(),
        saveTextSizeUseCase: SaveTextSizeUseCaseMock(),
      );
    },
  );

  testWidgets(
    'DishDescription should show valid data',
    (WidgetTester tester) async {
      const DishModel dish = DishModel(
        name: 'Cheeseburger',
        imageUrl: 'imageUrl',
        cost: 12.1,
        type: 'burger',
        description: 'description1',
        stats: {
          'kcal': 12,
          'fats': 22,
          'carbohydrates': 33,
          'proteins': 44,
        },
      );

      await tester.pumpWidget(
        BlocProvider<SettingsViewBloc>(
          create: (context) => settingsBloc,
          child: const MaterialApp(
            home: Scaffold(
              body: DishDescription(
                dish: dish,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Cheeseburger'), findsOneWidget);
      expect(find.text('name'), findsNothing);

      expect(find.text('44'), findsOneWidget);
      expect(find.text('55'), findsNothing);

      expect(find.text('description1'), findsOneWidget);
      expect(find.text('FDSAA'), findsNothing);
    },
  );

  testWidgets(
    'CartListViewItem should show valid data',
    (WidgetTester tester) async {
      const DishModel dish = DishModel(
        name: 'name',
        imageUrl: 'imageUrl',
        cost: 12.1,
        type: 'burger',
        description: 'description1',
        stats: {
          'kcal': 12,
          'fats': 22,
          'carbohydrates': 33,
          'proteins': 44,
        },
      );

      await tester.pumpWidget(
        BlocProvider<SettingsViewBloc>(
          create: (context) => settingsBloc,
          child: const MaterialApp(
            home: Scaffold(
              body: AdminDishGridItem(
                dish: dish,
              ),
            ),
          ),
        ),
      );

      expect(find.text('name'), findsOneWidget);
      expect(find.text('noname'), findsNothing);

      expect(find.text('12.1\$'), findsOneWidget);

      expect(find.text('burger'), findsNothing);
      expect(find.text('description1'), findsNothing);
    },
  );
}
