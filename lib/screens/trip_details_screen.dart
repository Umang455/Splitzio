import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TripDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Details'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 5, // Replace with your dynamic data count
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Expense ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        'Amount: \$${(index + 1) * 10}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.teal),
                          Text(
                            'User ${index + 1}',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/addExpense');
        },
        label: Text('Add Expense'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
