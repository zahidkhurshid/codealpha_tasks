import 'package:flutter/foundation.dart';

class Event {
  final int? id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String venue;
  final String organizer;
  final String category;
  final bool isNotificationEnabled;

  Event({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.venue,
    required this.organizer,
    required this.category,
    this.isNotificationEnabled = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'venue': venue,
      'organizer': organizer,
      'category': category,
      'isNotificationEnabled': isNotificationEnabled ? 1 : 0,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateTime: DateTime.parse(map['dateTime']),
      venue: map['venue'],
      organizer: map['organizer'],
      category: map['category'],
      isNotificationEnabled: map['isNotificationEnabled'] == 1,
    );
  }
}
