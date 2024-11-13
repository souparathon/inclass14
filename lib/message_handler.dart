import 'package:flutter/material.dart';

void handleNotification(BuildContext context, String? title, String? body) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title ?? "Notification"),
      content: Text(body ?? "No content available"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("OK"),
        ),
      ],
    ),
  );
}

void handleMessageData(Map<String, dynamic> data) {
  // Use this function to handle custom data from the notification payload.
  print("Message Data: $data");
}
