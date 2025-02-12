import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/trip_details_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/add_trip_screen.dart';
import 'screens/expense_detail_screen.dart';

void main() {
  runApp(TravelExpenseSplitterApp());
}

class TravelExpenseSplitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Expense Splitter',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the overall brightness to dark
        primaryColor: Colors.black, // Set the primary color to black
        colorScheme: ColorScheme.dark(primary: Colors.black, secondary: Colors.teal), // Update accentColor with secondary
        scaffoldBackgroundColor: Colors.black, // Set the background color to black
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set the app bar background to black
          titleTextStyle: TextStyle(color: Colors.white), // Set the title text color to white
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal, // Set button color to teal
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Set body text color to white (updated for newer Flutter)
          bodyMedium: TextStyle(color: Colors.white), // Set body text color to white (updated for newer Flutter)
          titleLarge: TextStyle(color: Colors.white), // Replace headline6 with titleLarge
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // The app starts at the login screen
      routes: {
        '/': (context) => HomeScreen(), // HomeScreen is at the root
        '/login': (context) => Login(), // Login screen
        '/signup': (context) => Signup(), // Signup screen
        '/tripDetails': (context) => TripDetailsScreen(), // Trip Details screen
        '/addExpense': (context) => AddExpenseScreen(), // Add Expense screen
        '/addTrip': (context) => AddTripScreen(), // Add Trip screen
        '/expenseDetail': (context) => ExpenseDetailsScreen(), // Add Trip screen
      },
    );
  }
}
