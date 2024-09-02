import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/providers/app_provider.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().fetchExpenditure();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        elevation: 0,
      ),
      body: const ExpensesList(),
    );
  }
}

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        if (appProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (appProvider.errorMessage != null) {
          return Center(child: Text(appProvider.errorMessage!));
        } else if (appProvider.expenditureItems.isEmpty) {
          return const Center(child: Text('No expenses found'));
        } else {
          // Group expenditure items by category
          final groupedExpenses = groupExpensesByCategory(appProvider.expenditureItems);
          return ListView.builder(
            itemCount: groupedExpenses.length,
            itemBuilder: (context, index) => ExpenseCategoryCard(category: groupedExpenses[index]),
          );
        }
      },
    );
  }

  List<Map<String, dynamic>> groupExpensesByCategory(List<ExpenditureItem> expenses) {
    final groupedExpenses = <String, List<ExpenditureItem>>{};
    for (var expense in expenses) {
      final category = expense.category ?? 'Uncategorized';
      if (!groupedExpenses.containsKey(category)) {
        groupedExpenses[category] = [];
      }
      groupedExpenses[category]!.add(expense);
    }
    return groupedExpenses.entries.map((entry) => {
      'category': entry.key,
      'items': entry.value,
    }).toList();
  }
}

class ExpenseCategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const ExpenseCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text(
          category['category'],
          style: Theme.of(context).textTheme.titleLarge,
        ),
        children: [
          for (ExpenditureItem item in category['items'])
            ExpenseItemTile(item: item, color: getUniqueColor(item.nameOfItem ?? '')),
        ],
      ),
    );
  }
}

class ExpenseItemTile extends StatelessWidget {
  final ExpenditureItem item;
  final Color color;

  const ExpenseItemTile({super.key, required this.item, required this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(getIconForItem(item.nameOfItem ?? ''), color: color),
      ),
      title: Text(item.nameOfItem ?? ''),
      trailing: Text(
        '\$${item.estimatedAmount?.toStringAsFixed(2) ?? '0.00'}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

// ... existing code ...

final List<Map<String, dynamic>> expenses = [
  {
    'category': 'Food',
    'items': [
      {'name': 'Groceries', 'amount': 120.50},
      {'name': 'Restaurant', 'amount': 45.00},
      {'name': 'Snacks', 'amount': 15.75},
    ],
  },
  {
    'category': 'Transport',
    'items': [
      {'name': 'Gas', 'amount': 50.00},
      {'name': 'Public Transit', 'amount': 30.00},
      {'name': 'Taxi', 'amount': 25.50},
    ],
  },
  {
    'category': 'Entertainment',
    'items': [
      {'name': 'Movies', 'amount': 20.00},
      {'name': 'Concerts', 'amount': 80.00},
      {'name': 'Books', 'amount': 35.99},
    ],
  },
];

Color getUniqueColor(String itemName) {
  final int hash = itemName.hashCode;
  return Color((hash & 0xFFFFFF) | 0xFF000000);
}

IconData getIconForItem(String itemName) {
  switch (itemName.toLowerCase()) {
    case 'groceries':
      return Icons.shopping_cart;
    case 'restaurant':
      return Icons.restaurant;
    case 'snacks':
      return Icons.fastfood;
    case 'gas':
      return Icons.local_gas_station;
    case 'public transit':
      return Icons.directions_bus;
    case 'taxi':
      return Icons.local_taxi;
    case 'movies':
      return Icons.movie;
    case 'concerts':
      return Icons.music_note;
    case 'books':
      return Icons.book;
    default:
      return Icons.attach_money;
  }
}