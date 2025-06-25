import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  static final NotiService _instance = NotiService._internal();

  factory NotiService() => _instance;

  NotiService._internal();

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  // Initialize Notification
  Future<void> initNotification() async {
    if (_isInitialized) return;

    // Android settings
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // Overall settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await notificationsPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  // Notification Details
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', // Channel ID
        'Daily Notifications', // Channel name
        channelDescription: 'This channel is used for daily notifications.',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // Show Notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationsPlugin.show(id, title, body, notificationDetails());
  }
}
