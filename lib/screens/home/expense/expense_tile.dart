import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:flutter/material.dart';

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