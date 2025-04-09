import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/screens/home/expense/add_expense_dialog.dart';
import 'package:expense_tracker/screens/home/expense/expense_empty.dart';
import 'package:expense_tracker/screens/home/expense/expense_tile.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<AppProvider>().fetchExpenditure();
    // });
    return Scaffold(
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
        return const AddExpenseDialog();
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
          return const ExpensesEmpty();
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
      final category = expense.category?.name ?? 'Uncategorized';
      groupedExpenses.containsKey(category) ? groupedExpenses[category]!.add(expense) : groupedExpenses.addAll({category: <ExpenditureItem>[expense]});
    }

    
    return groupedExpenses.entries.map((entry) => {
      'category': entry.key,
      'items': entry.value,
    }).toList();
  }
}

// class ExpenseCategoryCard extends StatelessWidget {
//   final Map<String, dynamic> category;

//   const ExpenseCategoryCard({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       child: ExpansionTile(
//         title: Text(
//           category['category'],
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         children: [
//           for (ExpenditureItem item in category['items'])
//             ExpenseItemTile(item: item, color: getUniqueColor(item.nameOfItem ?? '')),
//         ],
//       ),
//     );
//   }
// }