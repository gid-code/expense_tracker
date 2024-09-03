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
    
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppProvider>().fetchExpenditure();
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Expenses'),
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    const Color(0xff429690)
                  ]
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80,),
              Text(
                'My Expenses',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 45),
              const Expanded(child: ExpensesList()),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddExpenseDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddExpenseDialog();
      },
    );
  }
}

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        if (appProvider.isLoading && appProvider.expenditureItems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (appProvider.errorMessage != null) {
          return Center(child: Text(appProvider.errorMessage!));
        } else if (appProvider.expenditureItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 64,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'No expenses found',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to add an expense',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        } else {
          // Group expenditure items by category
          final groupedExpenses = groupExpensesByCategory(appProvider.expenditureItems);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: groupedExpenses.length,
            itemBuilder: (context, index) {
              final category = groupedExpenses[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      category['category'],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ...category['items'].map<Widget>((item) => 
                    ExpenseItemTile(
                      item: item, 
                      color: getUniqueColor(item.nameOfItem ?? '')
                    )
                  ).toList(),
                  const Divider(),
                ],
              );
            },
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
        'GHS ${item.estimatedAmount?.toStringAsFixed(2) ?? '0.00'}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

Color getUniqueColor(String itemName) {
  final int hash = itemName.hashCode;
  return Color((hash & 0xFFFFFF) | 0xFF000000);
}

IconData getIconForItem(String itemName) {
  final lowercaseItemName = itemName.toLowerCase();
  if (lowercaseItemName.contains('groceries')) {
    return Icons.shopping_cart;
  } else if (lowercaseItemName.contains('restaurant')) {
    return Icons.restaurant;
  } else if (lowercaseItemName.contains('snacks')) {
    return Icons.fastfood;
  } else if (lowercaseItemName.contains('gas')) {
    return Icons.local_gas_station;
  } else if (lowercaseItemName.contains('public transit')) {
    return Icons.directions_bus;
  } else if (lowercaseItemName.contains('taxi')) {
    return Icons.local_taxi;
  } else if (lowercaseItemName.contains('movies')) {
    return Icons.movie;
  } else if (lowercaseItemName.contains('concerts')) {
    return Icons.music_note;
  } else if (lowercaseItemName.contains('books')) {
    return Icons.book;
  } else {
    return Icons.attach_money;
  }
}

class AddExpenseDialog extends StatefulWidget {
  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? category;
  double? amount;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Expense'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              onSaved: (value) => name = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Category'),
              validator: (value) => value!.isEmpty ? 'Please enter a category' : null,
              onSaved: (value) => category = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Estimated Amount'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Please enter an amount' : null,
              onSaved: (value) => amount = double.tryParse(value!),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text('Add'),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AppProvider>().addExpense(name!, category!, amount!);
      Navigator.of(context).pop();
    }
  }
}