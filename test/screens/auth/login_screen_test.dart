import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:mockito/annotations.dart';
// class MockAppProvider extends Mock implements AppProvider {}
@GenerateMocks([AppProvider, GoRouter])

import 'login_screen_test.mocks.dart';

void main() {
  late MockAppProvider mockAppProvider;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockAppProvider = MockAppProvider();
    mockGoRouter = MockGoRouter();
  });

  Widget createLoginScreen() {
    return MaterialApp(
      home: InheritedGoRouter(
        goRouter: mockGoRouter,
        child: ChangeNotifierProvider<AppProvider>.value(
          value: mockAppProvider,
          child: const LoginScreen(),
        ),
      ),
    );
  }


  testWidgets('Login with valid credentials', (WidgetTester tester) async {
    when(mockAppProvider.isLoading).thenReturn(false);
    when(mockAppProvider.errorMessage).thenReturn(null);
    when(mockAppProvider.login(any, any)).thenAnswer((_) => Future.value());

    await tester.pumpWidget(createLoginScreen());

    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(mockAppProvider.login('test@example.com', 'password123')).called(1);
    verify(mockGoRouter.go('/dashboard')).called(1);
  });

  testWidgets('Login with invalid email', (WidgetTester tester) async {
    when(mockAppProvider.isLoading).thenReturn(false);

    await tester.pumpWidget(createLoginScreen());

    await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('Login button disabled when loading', (WidgetTester tester) async {
    when(mockAppProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createLoginScreen());

    final loginButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(loginButton.onPressed, isNull);
  });
}