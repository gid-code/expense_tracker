import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

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
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseCategoryCard(category: expenses[index]),
    );
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
          for (var item in category['items'])
            ExpenseItemTile(item: item, color: getUniqueColor(item['name'])),
        ],
      ),
    );
  }
}

class ExpenseItemTile extends StatelessWidget {
  final Map<String, dynamic> item;
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
        child: Icon(getIconForItem(item['name']), color: color),
      ),
      title: Text(item['name']),
      trailing: Text(
        '\$${item['amount'].toStringAsFixed(2)}',
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