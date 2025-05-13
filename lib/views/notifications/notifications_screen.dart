import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // imported implicitly by AppTheme

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: Theme.of(context).iconTheme, // Using the icon theme from the app theme
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(context,
              title: 'Upcoming Event Reminder',
              message: 'The "Music Concert" event will start tomorrow at 8:00 PM.',
              time: '5 minutes ago'),
          const Divider(),
          _buildNotificationItem(context,
              title: 'Booking Status Updated',
              message: 'Your VIP ticket booking for the "Art Exhibition" event has been confirmed.',
              time: '30 minutes ago'),
          const Divider(),
          _buildNotificationItem(context,
              title: 'Important Announcement',
              message: 'The registration period for the "Cultural Festival" has been extended until the end of the week.',
              time: '1 hour ago'),
          const Divider(),
          // You can add more notification items here
        ],
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context,
      {required String title, required String message, required String time, IconData? icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01), // 1% of screen height for vertical padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? Icons.notifications_active,
              size: Get.width * 0.06), // 6% of screen width for icon size
          SizedBox(width: Get.width * 0.04), // 4% of screen width for horizontal spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: Get.width * 0.045, // 4.5% of screen width for title font size
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: Get.height * 0.005), // 0.5% of screen height for spacing
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: Get.width * 0.035, // 3.5% of screen width for message font size
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: Get.height * 0.01), // 1% of screen height for spacing
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: Get.width * 0.03, // 3% of screen width for time font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}