import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              // App Logo
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.person_add,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 40),

              // Name Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Email Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Confirm Password Input
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Signup Button
              ElevatedButton(
                onPressed: () {
                  // Validate and create account
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Login Redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
