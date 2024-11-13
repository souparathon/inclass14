import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'message_handler.dart';

class Notifications {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> initializeFCM(
      BuildContext context, void Function(String) onMessage) async {
    await messaging.requestPermission();

    // Get the FCM token
    messaging.getToken().then((token) {
      print("FCM Token: $token");
    });

    // Listen for messages in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        String notificationMessage = message.notification!.body ?? "No message";
        onMessage(notificationMessage);
        handleNotification(
            context, message.notification!.title, message.notification!.body);
      }
      if (message.data.isNotEmpty) {
        handleMessageData(message.data);
      }
    });

    // Handle when the app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleNotification(
          context, message.notification?.title, message.notification?.body);
    });
  }
}
