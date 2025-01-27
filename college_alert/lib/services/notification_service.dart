import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/event.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final darwinSettings = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    final initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification tapped: ${response.payload}');
        _handleNotificationTap(response.payload);
      },
    );
  }

  void _handleNotificationTap(String? payload) {
    if (payload == null) return;

    // Parse the payload and navigate to the appropriate screen
    final parts = payload.split(':');
    if (parts.length != 2) return;

    final type = parts[0];
    final id = int.tryParse(parts[1]);
    if (id == null) return;

    switch (type) {
      case 'event':
        // TODO: Use navigation service to navigate to event details
        debugPrint('Navigate to event details: $id');
        break;
      default:
        debugPrint('Unknown notification type: $type');
    }
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'college_alert_channel',
      'College Alert Notifications',
      channelDescription: 'Notifications for college events and updates',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
    );

    await _notifications.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'college_alert_channel',
      'College Alert Notifications',
      channelDescription: 'Notifications for college events and updates',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  Future<void> scheduleRecurringNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required RepeatInterval repeatInterval,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'college_alert_channel',
      'College Alert Notifications',
      channelDescription: 'Notifications for college events and updates',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  Future<bool> shouldNotifyForEvent(Event event) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if notifications are enabled globally
    if (!(prefs.getBool('notifications_enabled') ?? true)) {
      return false;
    }

    // Check if notifications are enabled for this event category
    final categoryEnabled = prefs.getBool('${event.category.toLowerCase()}_notifications') ?? true;
    if (!categoryEnabled) {
      return false;
    }

    // Check lead time preference (in hours)
    final leadTime = prefs.getInt('notification_lead_time') ?? 1;
    final eventTime = event.dateTime;
    final now = DateTime.now();
    
    // Don't notify for past events
    if (eventTime.isBefore(now)) {
      return false;
    }

    // Check if we're within the lead time window
    final notificationTime = eventTime.subtract(Duration(hours: leadTime));
    return notificationTime.isAfter(now);
  }

  Future<void> scheduleEventNotification(Event event) async {
    if (!await shouldNotifyForEvent(event)) return;

    // Schedule notification 1 hour before the event
    final scheduledTime = event.dateTime.subtract(const Duration(hours: 1));
    if (scheduledTime.isAfter(DateTime.now())) {
      await scheduleNotification(
        id: event.id ?? 0,
        title: 'Upcoming Event: ${event.title}',
        body: 'Starting in 1 hour at ${event.venue}',
        scheduledDate: scheduledTime,
        payload: 'event:${event.id}',
      );
    }

    // Schedule notification 1 day before
    final oneDayBefore = event.dateTime.subtract(const Duration(days: 1));
    if (oneDayBefore.isAfter(DateTime.now())) {
      await scheduleNotification(
        id: (event.id ?? 0) + 1000,
        title: 'Event Tomorrow: ${event.title}',
        body: 'Tomorrow at ${event.dateTime.hour}:${event.dateTime.minute} - ${event.venue}',
        scheduledDate: oneDayBefore,
        payload: 'event:${event.id}',
      );
    }
  }

  Future<void> cancelEventNotifications(int eventId) async {
    await cancelNotification(eventId);
    await cancelNotification(eventId + 1000);
  }
}
