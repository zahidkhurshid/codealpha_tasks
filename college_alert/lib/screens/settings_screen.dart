import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SharedPreferences prefs;
  bool isLoading = true;

  // Notification settings
  bool notificationsEnabled = true;
  bool academicNotifications = true;
  bool culturalNotifications = true;
  bool sportsNotifications = true;
  bool clubNotifications = true;
  int notificationLeadTime = 30; // minutes

  // Theme settings
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
      academicNotifications = prefs.getBool('academic_notifications') ?? true;
      culturalNotifications = prefs.getBool('cultural_notifications') ?? true;
      sportsNotifications = prefs.getBool('sports_notifications') ?? true;
      clubNotifications = prefs.getBool('club_notifications') ?? true;
      notificationLeadTime = prefs.getInt('notification_lead_time') ?? 30;
      isDarkMode = prefs.getBool('dark_mode') ?? false;
      isLoading = false;
    });
  }

  Future<void> _saveSettings() async {
    await prefs.setBool('notifications_enabled', notificationsEnabled);
    await prefs.setBool('academic_notifications', academicNotifications);
    await prefs.setBool('cultural_notifications', culturalNotifications);
    await prefs.setBool('sports_notifications', sportsNotifications);
    await prefs.setBool('club_notifications', clubNotifications);
    await prefs.setInt('notification_lead_time', notificationLeadTime);
    await prefs.setBool('dark_mode', isDarkMode);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildSection(
            title: 'Notifications',
            icon: Icons.notifications_outlined,
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive alerts for upcoming events'),
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() => notificationsEnabled = value);
                  _saveSettings();
                },
              ),
              if (notificationsEnabled) ...[
                const Divider(),
                ListTile(
                  title: const Text('Notification Lead Time'),
                  subtitle: Text('$notificationLeadTime minutes before event'),
                  trailing: DropdownButton<int>(
                    value: notificationLeadTime,
                    items: [15, 30, 60, 120, 240, 1440].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('${value}min'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => notificationLeadTime = value);
                        _saveSettings();
                      }
                    },
                  ),
                ),
                const Divider(),
                CheckboxListTile(
                  title: const Text('Academic Events'),
                  value: academicNotifications,
                  onChanged: (value) {
                    setState(() => academicNotifications = value!);
                    _saveSettings();
                  },
                ),
                CheckboxListTile(
                  title: const Text('Cultural Events'),
                  value: culturalNotifications,
                  onChanged: (value) {
                    setState(() => culturalNotifications = value!);
                    _saveSettings();
                  },
                ),
                CheckboxListTile(
                  title: const Text('Sports Events'),
                  value: sportsNotifications,
                  onChanged: (value) {
                    setState(() => sportsNotifications = value!);
                    _saveSettings();
                  },
                ),
                CheckboxListTile(
                  title: const Text('Club Activities'),
                  value: clubNotifications,
                  onChanged: (value) {
                    setState(() => clubNotifications = value!);
                    _saveSettings();
                  },
                ),
              ],
            ],
          ),
          _buildSection(
            title: 'Appearance',
            icon: Icons.palette_outlined,
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Use dark theme'),
                value: isDarkMode,
                onChanged: (value) {
                  setState(() => isDarkMode = value);
                  _saveSettings();
                },
              ),
            ],
          ),
          _buildSection(
            title: 'About',
            icon: Icons.info_outline,
            children: [
              ListTile(
                title: const Text('Version'),
                subtitle: const Text('1.0.0'),
              ),
              ListTile(
                title: const Text('Developer'),
                subtitle: const Text('Your College Name'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
      ],
    ).animate().fadeIn().slideX();
  }
}
