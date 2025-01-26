import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final double amount;
  final String payer;

  ExpenseTile({required this.title, required this.amount, required this.payer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('Amount: \$${amount.toStringAsFixed(2)}'),
      trailing: Text('Paid by: $payer'),
    );
  }
}
