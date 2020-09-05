<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
    </intent-filter>
</receiver>
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
var initializationSettingsIOS = IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification);
var initializationSettings = InitializationSettings(
    initializationSettingsAndroid, initializationSettingsIOS);
await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: selectNotification);
    ar result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
          var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id', 'your channel name', 'your channel description',
    importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
var iOSPlatformChannelSpecifics = IOSNotificationDetails();
var platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.show(
    0, 'Notification', 'You have an appointment today', platformChannelSpecifics,
    payload: 'item x');
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
var androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your other channel id',
        'your other channel name', 'your other channel description');
var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
NotificationDetails platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.schedule(
    0,
    'scheduled appointment',
    'You have a scheduled appointment today',
    scheduledNotificationDateTime,
    platformChannelSpecifics);
    // cancel the notification with id value of zero
await flutterLocalNotificationsPlugin.cancel(0);