import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared preferences

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings & Account Management',
          style: TextStyle(color: Colors.white),
        ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Change Profile Settings
              ListTile(
                title: Text('Change Profile Settings',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.of(context).pushNamed(
                      '/editProfile'); // Navigate to edit profile screen
                },
              ),
              Divider(),
              // Manage Privacy Settings
              ListTile(
                title: Text('Manage Privacy Settings'),
                onTap: () {
                  // Implement privacy settings logic here
                  Navigator.of(context).pushNamed(
                      '/privacySettings'); // Navigate to privacy settings screen
                },
              ),
              Divider(),
              // Toggle Notification Preferences
              ListTile(
                title: Text('Notification Preferences'),
                onTap: () {
                  // Implement notification preferences logic here
                  Navigator.of(context).pushNamed(
                      '/notificationPreferences'); // Navigate to notification preferences screen
                },
              ),
              Divider(),
              // View Transaction History
              ListTile(
                title: Text('Transaction History'),
                onTap: () {
                  // Navigate to transaction history screen
                  Navigator.of(context).pushNamed('/transactionHistory');
                },
              ),
              Divider(),
              // Logout
              ListTile(
                title: Text('Logout'),
                onTap: () async {
                  // Handle logout logic
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(
                      'isLoggedIn', false); // Set login state to false
                  Navigator.of(context).pushReplacementNamed(
                      '/login'); // Navigate to login screen
                },
              ),
              Divider(),
              // Delete Account
              ListTile(
                title: Text('Delete Account'),
                onTap: () {
                  // Implement account deletion logic here
                  _showDeleteAccountDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Account'),
        content: Text(
            'Are you sure you want to delete your account? This action cannot be undone.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement account deletion logic here
              // For example, delete user data from the database
              Navigator.of(ctx).pop(); // Close the dialog
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
