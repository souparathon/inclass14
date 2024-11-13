import 'package:flutter/material.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? notificationText;

  @override
  void initState() {
    super.initState();
    Notifications.initializeFCM(context, onNotificationReceived);
  }

  void onNotificationReceived(String message) {
    setState(() {
      notificationText = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Messaging"),
      ),
      body: Center(
        child: Text(notificationText ?? "Waiting for notifications..."),
      ),
    );
  }
}
