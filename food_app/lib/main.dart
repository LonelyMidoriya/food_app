import 'package:core/di/app_di.dart';
import 'package:core_ui/colors/custom_orange_color.dart';
import 'package:dishes_view/dishes_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDI().initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomOrangeColor,
      ),
      home: const DishesViewPage(),
    );
  }
}