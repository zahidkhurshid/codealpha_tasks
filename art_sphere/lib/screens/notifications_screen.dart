import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample notifications data
    final List<Map<String, String>> notifications = [
      {'type': 'like', 'message': 'User1 liked your artwork!'},
      {'type': 'comment', 'message': 'User2 commented on your artwork!'},
      {'type': 'follow', 'message': 'User3 started following you!'},
      {'type': 'sale', 'message': 'Your artwork has been sold!'},
      {'type': 'commission', 'message': 'You have a new commission request!'},
      {
        'type': 'announcement',
        'message': 'Featured Artist of the Week: Artist4!'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return ListTile(
              title: Text(
                notification['message']!,
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(_getIconForNotificationType(notification['type']!)),
              onTap: () {
                // Handle notification tap if needed
              },
            );
          },
        ),
      ),
    );
  }

  IconData _getIconForNotificationType(String type) {
    switch (type) {
      case 'like':
        return Icons.thumb_up;
      case 'comment':
        return Icons.comment;
      case 'follow':
        return Icons.person_add;
      case 'sale':
        return Icons.attach_money;
      case 'commission':
        return Icons.assignment;
      case 'announcement':
        return Icons.announcement;
      default:
        return Icons.notifications;
    }
  }
}
