import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import the FFI package
import 'screens/splash_screen.dart'; // Import the splash screen
import 'screens/onboarding_screen.dart'; // Import the onboarding screen
import 'auth/login_screen.dart'; // Import the login screen
import 'auth/signup_screen.dart'; // Import the sign-up screen
import 'screens/terms_conditions_screen.dart'; // Import the Terms & Conditions screen
import 'screens/home_screen.dart'; // Import the Home Screen
import 'screens/artwork_detail_screen.dart'; // Import the Artwork Detail Screen
import 'screens/profile_screen.dart'; // Import the Profile Screen
import 'screens/artist_profile_screen.dart'; // Import the Artist Profile Screen
import 'screens/upload_artwork_screen.dart'; // Import the Upload Artwork Screen
import 'screens/explore_screen.dart'; // Import the Explore/Search Screen
import 'screens/notifications_screen.dart'; // Import the Notifications Screen
import 'screens/settings_screen.dart'; // Import the Settings Screen
import 'screens/edit_profile_screen.dart'; // Import the Edit Profile Screen
import 'screens/privacy_settings_screen.dart'; // Import the Privacy Settings Screen
import 'screens/notification_preferences_screen.dart'; // Import the Notification Preferences Screen
import 'screens/transaction_history_screen.dart'; // Import the Transaction History Screen
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Initialize the database factory for FFI
  sqfliteFfiInit(); // Call this to initialize the FFI implementation
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArtSphere',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set the SplashScreen as home widget
      routes: {
        '/onboarding': (context) =>
            OnboardingScreen(title: 'Onboarding'), // Pass title
        '/login': (context) => LoginScreen(), // Define the login route
        '/signup': (context) => SignUpScreen(), // Define the sign-up route
        '/terms': (context) =>
            TermsConditionsScreen(), // Define the Terms & Conditions route
        '/home': (context) => HomeScreen(), // Define the Home Screen route
        '/upload': (context) =>
            UploadArtworkScreen(), // Define the upload artwork route
        '/artworkDetail': (context) =>
            ArtworkDetailScreen(), // Define the artwork detail route
        '/profile': (context) => ProfileScreen(), // Define the profile route
        '/artistProfile': (context) =>
            ArtistProfileScreen(), // Define the artist profile route
        '/explore': (context) =>
            ExploreScreen(), // Define the Explore/Search route
        '/notifications': (context) =>
            NotificationsScreen(), // Define the Notifications route
        '/settings': (context) => SettingsScreen(), // Define the Settings route
        '/editProfile': (context) =>
            EditProfileScreen(), // Add the route for Edit Profile Screen
        '/privacySettings': (context) =>
            PrivacySettingsScreen(), // Add the route for Privacy Settings Screen
        '/notificationPreferences': (context) =>
            NotificationPreferencesScreen(), // Add the route for Notification Preferences Screen
        '/transactionHistory': (context) =>
            TransactionHistoryScreen(), // Add the route for Transaction History Screen
      },
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Default to false if not set
  }
}
