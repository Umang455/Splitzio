import 'package:flutter/material.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  // Dummy Data
  final String tripName = 'Goa Trip';
  final String personName = 'Alice';
  final String amount = '200';
  final String description = 'Expenses for transportation, food, and activities.';

  // Constructor to accept the expense details (commented out for dummy data)
  // ExpenseDetailsScreen({
  //   required this.tripName,
  //   required this.personName,
  //   required this.amount,
  //   required this.description,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Details'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Name
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Trip: $tripName',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Person who paid
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Paid by: $personName',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Amount
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Amount: \$${amount}',
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Description
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description: $description',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Go back button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
