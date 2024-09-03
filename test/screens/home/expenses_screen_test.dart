import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/screens/home/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

// Generate mocks
@GenerateMocks([AppProvider])
import 'expenses_screen_test.mocks.dart';

void main() {
  late MockAppProvider mockAppProvider;

  setUp(() {
    mockAppProvider = MockAppProvider();
  });

  Widget createExpensesScreen() {
    return MaterialApp(
      home: ChangeNotifierProvider<AppProvider>.value(
        value: mockAppProvider,
        child: const ExpensesScreen(),
      ),
    );
  }

  group('ExpensesScreen', () {
    testWidgets('shows loading indicator when isLoading is true', (WidgetTester tester) async {
      when(mockAppProvider.isLoading).thenReturn(true);
      when(mockAppProvider.errorMessage).thenReturn(null);
      when(mockAppProvider.expenditureItems).thenReturn([]);

      await tester.pumpWidget(createExpensesScreen());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when errorMessage is not null', (WidgetTester tester) async {
      when(mockAppProvider.isLoading).thenReturn(false);
      when(mockAppProvider.errorMessage).thenReturn('Error loading expenses');
      when(mockAppProvider.expenditureItems).thenReturn([]);

      await tester.pumpWidget(createExpensesScreen());
      await tester.pump();

      expect(find.text('Error loading expenses'), findsOneWidget);
    });

    testWidgets('shows empty state when expenditureItems is empty', (WidgetTester tester) async {
      when(mockAppProvider.isLoading).thenReturn(false);
      when(mockAppProvider.errorMessage).thenReturn(null);
      when(mockAppProvider.expenditureItems).thenReturn([]);

      await tester.pumpWidget(createExpensesScreen());
      await tester.pump();

      expect(find.text('No expenses found'), findsOneWidget);
      expect(find.text('Tap the + button to add an expense'), findsOneWidget);
    });

    testWidgets('shows grouped expenses when expenditureItems is not empty', (WidgetTester tester) async {
      when(mockAppProvider.isLoading).thenReturn(false);
      when(mockAppProvider.errorMessage).thenReturn(null);
      when(mockAppProvider.expenditureItems).thenReturn([
        ExpenditureItem(id: "1", nameOfItem: 'Groceries', category: 'Food', estimatedAmount: 50),
        ExpenditureItem(id: "2", nameOfItem: 'Gas', category: 'Transportation', estimatedAmount: 30),
      ]);

      await tester.pumpWidget(createExpensesScreen());
      await tester.pump();

      expect(find.text('Food'), findsOneWidget);
      expect(find.text('Transportation'), findsOneWidget);
      expect(find.text('Groceries'), findsOneWidget);
      expect(find.text('Gas'), findsOneWidget);
      expect(find.text('GHS 50.00'), findsOneWidget);
      expect(find.text('GHS 30.00'), findsOneWidget);
    });

    testWidgets('opens AddExpenseDialog when FAB is tapped', (WidgetTester tester) async {
      when(mockAppProvider.isLoading).thenReturn(false);
      when(mockAppProvider.errorMessage).thenReturn(null);
      when(mockAppProvider.expenditureItems).thenReturn([]);

      await tester.pumpWidget(createExpensesScreen());
      await tester.pump();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.text('Add New Expense'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
    });
  });
}