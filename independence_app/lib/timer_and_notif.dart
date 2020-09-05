// This does not work


import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin localNotificationsPlugin =
FlutterLocalNotificationsPlugin();
initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
}

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(Duration(seconds: 10), 0, callback);
    runApp(MyApp());
}

void callback() {
    DateTime now = DateTime.now().toUtc();
    singleNotification(
        now,
        "Notification",
        "This is a notification",
        98123871,
    );
    print("wasd");
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return MaterialApp (
            title: 'Demo',
            theme: ThemeData(),
            home: MyHomePage()
        );
    }
}

Future singleNotification(
    DateTime datetime, String message, String subtext, int hashcode,
    {String sound}) async {
    var androidChannel = AndroidNotificationDetails(
        'channel-id',
        'channel-name',
        'channel-description',
        importance: Importance.Max,
        priority: Priority.Max,
    );

    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
}

class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold (
            appBar: AppBar (
                title: Text("Example"),
            ),
            body: Center(),
        );
    }
}