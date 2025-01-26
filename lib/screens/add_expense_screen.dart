import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Expense Title',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixText: '\$',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the expense
              },
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
