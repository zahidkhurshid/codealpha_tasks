import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart' as calendar;
import '../models/event.dart';
import '../widgets/background_container.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  void _addToCalendar() {
    final calendar.Event calendarEvent = calendar.Event(
      title: event.title,
      description: event.description,
      location: event.venue,
      startDate: event.dateTime,
      endDate: event.dateTime.add(const Duration(hours: 2)),
    );
    calendar.Add2Calendar.addEvent2Cal(calendarEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: BackgroundContainer(
        backgroundImage: 'assets/images/event_background.jpg',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 16.0),
              _buildInfoRow(Icons.calendar_today, 'Date & Time',
                  '${event.dateTime.toString().split('.')[0]}'),
              _buildInfoRow(Icons.location_on, 'Venue', event.venue),
              _buildInfoRow(Icons.person, 'Organizer', event.organizer),
              _buildInfoRow(Icons.category, 'Category', event.category),
              SizedBox(height: 16.0),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8.0),
              Text(event.description),
              SizedBox(height: 24.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _addToCalendar,
                  icon: Icon(Icons.calendar_today),
                  label: Text('Add to Calendar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20.0),
          SizedBox(width: 8.0),
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
