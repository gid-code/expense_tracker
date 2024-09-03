import 'package:expense_tracker/models/auth_models.dart';
import 'package:expense_tracker/models/income_item.dart';
import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/home/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

@GenerateMocks([AppProvider, GoRouter])
import 'dashboard_screen_test.mocks.dart';

void main() {
  late MockAppProvider mockAppProvider;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockAppProvider = MockAppProvider();
    mockGoRouter = MockGoRouter();

    // Default stubs
    when(mockAppProvider.isLoading).thenReturn(false);
    when(mockAppProvider.userProfile).thenReturn(UserProfile(name: 'John Doe', email: 'john@example.com'));
    when(mockAppProvider.balance).thenReturn(1000.0);
    when(mockAppProvider.totalIncome).thenReturn(1500.0);
    when(mockAppProvider.totalExpenditure).thenReturn(500.0);
    when(mockAppProvider.incomeItems).thenReturn([]);
    when(mockAppProvider.expenditureItems).thenReturn([]);
  });

  Widget createDashboardScreen() {
    return MaterialApp(
      home: InheritedGoRouter(
        goRouter: mockGoRouter,
        child: ChangeNotifierProvider<AppProvider>.value(
          value: mockAppProvider,
          child: const Scaffold(body:DashboardScreen()),
        ),
      ),
    );
  }

  testWidgets('DashboardScreen UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(createDashboardScreen());

    expect(find.text('Welcome,'), findsOneWidget);
    expect(find.text('John!'), findsOneWidget);
    expect(find.text('Total Balance'), findsOneWidget);
    expect(find.text('GHS 1000.00'), findsOneWidget);
    
    // For "Income" and "Expenses", we'll look for their specific values instead
    expect(find.text('GHS 1500.00'), findsOneWidget);
    expect(find.text('GHS 500.00'), findsOneWidget);
    
    expect(find.text('Income vs Expenses'), findsOneWidget);
    expect(find.text('Revenue History'), findsOneWidget);
    expect(find.text('Add New'), findsOneWidget);

    expect(find.byType(BarChart), findsOneWidget);
  });

  testWidgets('DashboardScreen loads data on init', (WidgetTester tester) async {
    await tester.pumpWidget(createDashboardScreen());
    await tester.pumpAndSettle();

    verify(mockAppProvider.fetchAllFinanceData()).called(1);
  });

  testWidgets('DashboardScreen shows loading indicator', (WidgetTester tester) async {
    when(mockAppProvider.isLoading).thenReturn(true);
    when(mockAppProvider.incomeItems).thenReturn([]);
    when(mockAppProvider.expenditureItems).thenReturn([]);

    await tester.pumpWidget(createDashboardScreen());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('DashboardScreen shows charts', (WidgetTester tester) async {
    await tester.pumpWidget(createDashboardScreen());

    expect(find.byType(BarChart), findsOneWidget);
  });

  // testWidgets('DashboardScreen shows revenue history', (WidgetTester tester) async {
  //   when(mockAppProvider.incomeItems).thenReturn([
  //     IncomeItem(id: '1', nameOfRevenue: 'Salary', amount: 1000),
  //     IncomeItem(id: '2', nameOfRevenue: 'Bonus', amount: 500),
  //   ]);

  //   await tester.pumpWidget(createDashboardScreen());

  //   // Find the revenue history section
  //   final revenueHistorySection = find.ancestor(
  //     of: find.text('Revenue History'),
  //     matching: find.byType(Column),
  //   );

  //   // Check for income items within the revenue history section
  //   expect(find.descendant(
  //     of: revenueHistorySection,
  //     matching: find.text('Salary'),
  //   ), findsOneWidget);
  //   expect(find.descendant(
  //     of: revenueHistorySection,
  //     matching: find.text('GHS 1000.00'),
  //   ), findsOneWidget);
  //   expect(find.descendant(
  //     of: revenueHistorySection,
  //     matching: find.text('Bonus'),
  //   ), findsOneWidget);
  //   expect(find.descendant(
  //     of: revenueHistorySection,
  //     matching: find.text('GHS 500.00'),
  //   ), findsOneWidget);
  // });

  testWidgets('DashboardScreen shows "No revenue history" message', (WidgetTester tester) async {
    when(mockAppProvider.incomeItems).thenReturn([]);

    await tester.pumpWidget(createDashboardScreen());

    expect(find.text('No revenue history yet'), findsOneWidget);
    expect(find.text('Tap "Add New" to record your first income'), findsOneWidget);
  });

  // testWidgets('DashboardScreen adds new revenue', (WidgetTester tester) async {
  //   when(mockAppProvider.addIncome(any, any)).thenAnswer((_) => Future.value());
  //   when(mockAppProvider.errorMessage).thenReturn(null);

  //   await tester.pumpWidget(createDashboardScreen());

  //   // Open the "Add New" dialog
  //   await tester.tap(find.text('Add New'));
  //   await tester.pumpAndSettle();

  //   // Verify that the dialog is open
  //   expect(find.text('Add New Revenue'), findsOneWidget);

  //   // Find the text fields
  //   final revenueNameField = find.widgetWithText(TextField, 'Revenue Name');
  //   final amountField = find.widgetWithText(TextField, 'Amount');

  //   // Verify that the text fields are present
  //   expect(revenueNameField, findsOneWidget);
  //   expect(amountField, findsOneWidget);

  //   // Enter text into the fields
  //   await tester.enterText(revenueNameField, 'New Income');
  //   await tester.enterText(amountField, '100');

  //   // Find and tap the submit button
  //   final submitButton = find.widgetWithText(ElevatedButton, 'Submit');
  //   expect(submitButton, findsOneWidget);
  //   await tester.tap(submitButton);
  //   await tester.pumpAndSettle();

  //   // Verify that the addIncome method was called with the correct arguments
  //   verify(mockAppProvider.addIncome('New Income', 100)).called(1);

  //   // Verify that the dialog is closed
  //   expect(find.text('Add New Revenue'), findsNothing);
  // });

}