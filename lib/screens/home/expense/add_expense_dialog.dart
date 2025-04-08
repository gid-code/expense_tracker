import 'package:expense_tracker/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseDialog extends StatefulWidget {
  const AddExpenseDialog({super.key});

  @override
  State<AddExpenseDialog> createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? category;
  int? categoryId;
  String? amount;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Expense'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              onSaved: (value) => name = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Category'),
              validator: (value) => value!.isEmpty ? 'Please enter a category' : null,
              onSaved: (value) => category = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Estimated Amount'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Please enter an amount' : null,
              onSaved: (value) => amount = value,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AppProvider>().addExpense(name!, category!, double.tryParse(amount!) ?? 0.0);
      Navigator.of(context).pop();
    }
  }
}