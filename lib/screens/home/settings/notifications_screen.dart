import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_rounded,
            size: 75,
            color: colorScheme.secondary.withOpacity(0.7),
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("No notifications available at the moment",
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7)
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}