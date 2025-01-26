import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AddTripScreen extends StatefulWidget {
  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final TextEditingController tripNameController = TextEditingController();
  final List<TextEditingController> peopleControllers = [];

  void addPerson() {
    setState(() {
      peopleControllers.add(TextEditingController());
    });
  }

  void removePerson(int index) {
    setState(() {
      peopleControllers.removeAt(index);
    });
  }

  void saveTrip() {
    // Logic to save trip details
    final tripName = tripNameController.text;
    final people = peopleControllers.map((controller) => controller.text).toList();

    // Debug print for testing
    print('Trip Name: $tripName');
    print('People: $people');

    // Navigate back or show success message
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Trip'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Name Input
            TextField(
              controller: tripNameController,
              decoration: InputDecoration(
                labelText: 'Trip Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),

            // People List with Animation
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: peopleControllers.length,
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
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              title: TextField(
                                controller: peopleControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Person ${index + 1}',
                                  border: InputBorder.none,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => removePerson(index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Add Person Button
            ElevatedButton.icon(
              onPressed: addPerson,
              icon: Icon(Icons.add),
              label: Text('Add Person'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Save Trip Button
            Center(
              child: ElevatedButton(
                onPressed: saveTrip,
                child: Text('Save Trip'),
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
