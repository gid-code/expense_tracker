import 'package:expense_tracker/models/auth_models.dart';
import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// Generate mocks
@GenerateMocks([AppProvider, GoRouter])
import 'settings_screen_test.mocks.dart';

void main() {
  late MockAppProvider mockAppProvider;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockAppProvider = MockAppProvider();
    mockGoRouter = MockGoRouter();

    // Set up mock behavior
    when(mockAppProvider.userProfile).thenReturn(
      UserProfile(name: 'Test User', email: 'test@example.com'),
    );

    when(mockAppProvider.logout()).thenAnswer((_) async => {});
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: ChangeNotifierProvider<AppProvider>.value(
        value: mockAppProvider,
        child: InheritedGoRouter(
          goRouter: mockGoRouter,
          child: const Scaffold(body:SettingsScreen()),
        ),
      ),
    );
  }

  testWidgets('SettingsScreen displays user info and settings sections', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Verify user info is displayed
    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);

    // Verify settings sections are present
    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Preferences'), findsOneWidget);
    expect(find.text('Security'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    // Verify specific settings tiles
    expect(find.text('Account Information'), findsOneWidget);
    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Privacy & Security'), findsOneWidget);
    expect(find.text('About Us'), findsOneWidget);

    // Verify logout button is present
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Tapping on Account Information navigates to the correct route', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Account Information'));
    await tester.pumpAndSettle();

    verify(mockGoRouter.go('/settings/account-information')).called(1);
  });

  testWidgets('Tapping on Appearance navigates to the correct route', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Appearance'));
    await tester.pumpAndSettle();

    verify(mockGoRouter.go('/settings/appearance')).called(1);
  });
}