import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class TripsProvider with ChangeNotifier {
  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }
}
