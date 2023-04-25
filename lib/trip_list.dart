import 'package:flutter/material.dart';
import 'object_models.dart';
import 'package:intl/intl.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  TripList({required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (BuildContext context, int index) {
        final trip = trips[index];
        final startDateFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.start);
        final endDateFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.end);
        return ListTile(
          title: Text(trip.destination),
          subtitle: Text('$startDateFormatted - $endDateFormatted'),
          trailing: ElevatedButton(
            child: Text('View More'),
            onPressed: () {
              _showTripDetails(context, trip);
            },
          ),
        );
      },
    );
  }

  void _showTripDetails(BuildContext context, Trip trip) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final startDateFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.start);
        final endDateFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.end);
        final checkInFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.hotel.checkIn);
        final checkOutFormatted = DateFormat('yyyy-MM-dd hh:mm a').format(trip.hotel.checkOut);
        return AlertDialog(
          title: Text(trip.destination),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start Date: $startDateFormatted'),
                Text('End Date: $endDateFormatted'),
                Text('Budget: ${trip.budget}'),
                Text('Flight:'),
                Text(' - Departure: ${trip.flight.departure}'),
                Text(' - Arrival: ${trip.flight.arrival}'),
                Text(' - Flight Number: ${trip.flight.flightNum}'),
                Text('Hotel:'),
                Text(' - Check-in: $checkInFormatted'),
                Text(' - Check-out: $checkOutFormatted'),
                Text(' - Room Number: ${trip.hotel.roomNum}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}