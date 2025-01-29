import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  // Dummy Data for Trips and People
  final List<Map<String, dynamic>> dummyTrips = [
    {
      'id': '1',
      'name': 'Goa Trip',
      'people': ['Alice', 'Bob', 'Charlie'],
    },
    {
      'id': '2',
      'name': 'Manali Trip',
      'people': ['David', 'Eva', 'Frank'],
    },
    {
      'id': '3',
      'name': 'Kerala Trip',
      'people': ['Grace', 'Henry', 'Ivy'],
    },
  ];

  // Controllers and State Variables
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedTripId;
  String? selectedPerson;

  // Get People for the Selected Trip
  List<String> getPeopleForSelectedTrip() {
    if (selectedTripId == null) return [];
    final selectedTrip = dummyTrips.firstWhere((trip) => trip['id'] == selectedTripId);
    return selectedTrip['people'];
  }

  // Save Expense Logic
  void saveExpense() {
    if (selectedTripId == null || selectedPerson == null || amountController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields.')),
      );
      return;
    }

    final amount = amountController.text;
    final description = descriptionController.text;

    // Debug print for testing
    print('Selected Trip ID: $selectedTripId');
    print('Selected Person: $selectedPerson');
    print('Amount: $amount');
    print('Description: $description');

    // Navigate back or show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Expense Saved Successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Expense'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to Select Trip
            DropdownButtonFormField<String>(
              value: selectedTripId,
              decoration: InputDecoration(
                labelText: 'Select Trip',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: dummyTrips.map((trip) {
                return DropdownMenuItem<String>(
                  value: trip['id'],
                  child: Text(trip['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTripId = value;
                  selectedPerson = null; // Reset selected person when trip changes
                });
              },
            ),
            SizedBox(height: 16),

            // Dropdown to Select Person
            if (selectedTripId != null) ...[
              DropdownButtonFormField<String>(
                value: selectedPerson,
                decoration: InputDecoration(
                  labelText: 'Select Person',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: getPeopleForSelectedTrip().map((person) {
                  return DropdownMenuItem<String>(
                    value: person,
                    child: Text(person),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPerson = value;
                  });
                },
              ),
            ] else ...[
              // If no trip selected, show an empty field for people selection.
              Container(),
            ],
            SizedBox(height: 16),

            // Amount Input
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Description Input
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),

            // Save Expense Button
            Center(
              child: ElevatedButton(
                onPressed: saveExpense,
                child: Text('Save Expense'),
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
