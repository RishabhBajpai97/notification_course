import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  AwesomeNotifications().initialize(null,
  [NotificationChannel(channelKey: "basic_channel",channelName: "basic_channel", channelDescription: "Basic channel", importance: NotificationImportance.Max, defaultPrivacy: NotificationPrivacy.Public,icon: "resource://drawable/res_naruto",playSound: false),], debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    } );
    super.initState();
  }
  void triggernotification(){
    AwesomeNotifications().createNotification(content: NotificationContent(id: 1, channelKey: "basic_channel", title: "Basic Notification",body: "A basic notification", bigPicture: "https://images.unsplash.com/photo-1624644924076-79f74389c42e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80", notificationLayout: NotificationLayout.BigPicture));
    debugPrint("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(child: Text("Trigger Notification"),onPressed: triggernotification,)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
