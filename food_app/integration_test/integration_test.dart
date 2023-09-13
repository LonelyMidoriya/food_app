import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'mock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late SettingsViewBloc settingsBloc;
  late AuthViewBloc authBloc;

  group(
    'SettingsScreen smoke test',
    () {
      setUpAll(
        () async {

          SharedPreferences.setMockInitialValues(
            {"textSize": 18},
          );

          settingsBloc = SettingsViewBloc(
            fetchTextSizeUseCase: GetTextSizeUseCaseMock(),
            saveTextSizeUseCase: SaveTextSizeUseCaseMock(),
          );

          authBloc = AuthViewBloc(
            signUpWithEmailAndPasswordUsecase: SignUpWithEmailAndPasswordUsecaseMock(),
            logInUsecase: LogInUsecaseMock(),
            signOutUsecase: SignOutUsecaseMock(),
            signUpWithGoogleUsecase: SignUpWithGoogleUsecaseMock(),
            checkIfLoggedInUsecase: CheckIfLoggedInUsecaseMock(),
            addUserUsecase: AddUserUseCaseMock(),
            fetchUserUseCase: GetUserUseCaseMock(),
          );
        },
      );

      testWidgets(
        'TextSizeListTile smoke test',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            BlocProvider<AuthViewBloc>(
              create: (BuildContext context) => authBloc,
              child: BlocProvider<SettingsViewBloc>(
                create: (BuildContext context) => settingsBloc,
                child: AdaptiveTheme(
                  light: lightTheme,
                  initial: AdaptiveThemeMode.system,
                  dark: darkTheme,
                  builder: (theme, darkTheme) => MaterialApp(
                    theme: theme,
                    darkTheme: darkTheme,
                    home: const SettingsViewScreen(),
                  ),
                ),
              ),
            ),
          );

          expect(find.text('18'), findsOneWidget);
          expect(find.text('22'), findsNothing);

          await tester.tap(find.text('Text size'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));
          await tester.tap(find.text('Large'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));

          expect(find.text('22'), findsOneWidget);
          expect(find.text('18'), findsNothing);

          await tester.tap(find.text('Small'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));

          expect(find.text('14'), findsOneWidget);
          expect(find.text('22'), findsNothing);

          await tester.pump(const Duration(seconds: 1));
        },
      );

      testWidgets(
        'ThemeListTile smoke test',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            BlocProvider<AuthViewBloc>(
              create: (BuildContext context) => authBloc,
              child: BlocProvider<SettingsViewBloc>(
                create: (BuildContext context) => settingsBloc,
                child: AdaptiveTheme(
                  light: lightTheme,
                  initial: AdaptiveThemeMode.system,
                  dark: darkTheme,
                  builder: (theme, darkTheme) => MaterialApp(
                    theme: theme,
                    darkTheme: darkTheme,
                    home: const SettingsViewScreen(),
                  ),
                ),
              ),
            ),
          );

          expect(find.text('Light'), findsNothing);
          expect(find.text('System'), findsOneWidget);

          await tester.tap(find.text('Theme Mode'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));
          await tester.tap(find.text('Light'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));
          await tester.tap(find.text('Theme Mode'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));

          expect(find.text('Light'), findsOneWidget);
          expect(find.text('System'), findsNothing);

          await tester.tap(find.text('Theme Mode'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));
          await tester.tap(find.text('Dark'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));
          await tester.tap(find.text('Theme Mode'));
          await tester.pumpAndSettle();
          await tester.pump(const Duration(milliseconds: 100));

          expect(find.text('Dark'), findsOneWidget);
          expect(find.text('System'), findsNothing);

          await tester.pump(const Duration(seconds: 1));
        },
      );
    },
  );
}
