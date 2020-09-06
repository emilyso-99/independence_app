//Daily notifcation at setable time

void _configureCustomReminder(bool value) {
  if (customNotificationTime != null) {
    if (value) {
      var now = new DateTime.now();
      var notificationTime = new DateTime(now.year, now.month, now.day,
          customNotificationTime.hour, customNotificationTime.minute);

      getStore().dispatch(SetReminderAction(
          time: notificationTime.toIso8601String(),
          name: custom,
          repeat: RepeatInterval.Daily));

      scheduleNotification(
          flutterLocalNotificationsPlugin, '4', custom, notificationTime);
    } else {
      getStore().dispatch(RemoveReminderAction(custom));
      turnOffNotificationById(flutterLocalNotificationsPlugin, 4);
    }
  }
}

Future<void> turnOffNotificationById(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    num id) async {
  await flutterLocalNotificationsPlugin.cancel(id);
}
