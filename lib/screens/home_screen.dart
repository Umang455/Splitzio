import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Here are your upcoming trips:',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),

          // List of Trips with Animation
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: 5, // Replace with your dynamic data count
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 50,
                      child: FadeInAnimation(
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              'Trip ${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              'Date: 2023-10-01',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                            onTap: () {
                              Navigator.pushNamed(context, '/tripDetails');
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button
    floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.pushNamed(context, '/addTrip');
  },
  label: Text('Add Trip'),
  icon: Icon(Icons.add),
  backgroundColor: Colors.teal,


      ),
    );
  }
}
