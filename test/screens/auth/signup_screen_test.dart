import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

@GenerateMocks([AppProvider, GoRouter])
import 'signup_screen_test.mocks.dart';

void main() {
  late MockAppProvider mockAppProvider;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockAppProvider = MockAppProvider();
    mockGoRouter = MockGoRouter();
    when(mockAppProvider.isLoading).thenReturn(false);
  });

  Widget createSignupScreen() {
    return MaterialApp(
      home: InheritedGoRouter(
        goRouter: mockGoRouter,
        child: ChangeNotifierProvider<AppProvider>.value(
          value: mockAppProvider,
          child: const SignupScreen(),
        ),
      ),
    );
  }

  testWidgets('SignupScreen UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(createSignupScreen());

    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Already have an account? Login'), findsOneWidget);
  });

  testWidgets('Signup with valid credentials', (WidgetTester tester) async {
    when(mockAppProvider.errorMessage).thenReturn(null);
    when(mockAppProvider.signup(any, any, any)).thenAnswer((_) => Future.value(true));

    await tester.pumpWidget(createSignupScreen());

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextFormField).at(1), 'john@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password123');
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    verify(mockAppProvider.signup('John Doe', 'john@example.com', 'password123')).called(1);
    verify(mockGoRouter.go('/dashboard')).called(1);
  });

  testWidgets('Signup with invalid email', (WidgetTester tester) async {
    await tester.pumpWidget(createSignupScreen());

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextFormField).at(1), 'invalid-email');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password123');
    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('Signup with mismatched passwords', (WidgetTester tester) async {
    await tester.pumpWidget(createSignupScreen());

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextFormField).at(1), 'john@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password456');
    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Passwords do not match'), findsOneWidget);
  });

  testWidgets('Signup button disabled when loading', (WidgetTester tester) async {
    when(mockAppProvider.isLoading).thenReturn(true);

    await tester.pumpWidget(createSignupScreen());

    final registerButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(registerButton.onPressed, isNull);
  });

  testWidgets('Navigate to login screen', (WidgetTester tester) async {
    await tester.pumpWidget(createSignupScreen());

    await tester.tap(find.text('Already have an account? Login'));
    await tester.pump();

    verify(mockGoRouter.go('/login')).called(1);
  });

  testWidgets('Show error message on signup failure', (WidgetTester tester) async {
    when(mockAppProvider.errorMessage).thenReturn('Signup failed');
    when(mockAppProvider.signup(any, any, any)).thenAnswer((_) => Future.value(false));

    await tester.pumpWidget(createSignupScreen());

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextFormField).at(1), 'john@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'password123');
    await tester.enterText(find.byType(TextFormField).at(3), 'password123');
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Signup failed'), findsOneWidget);
  });
}