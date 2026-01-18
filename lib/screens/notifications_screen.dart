import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Mark All Read')),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildNotificationItem(
              title: 'Service Request Update',
              message: 'Your brake service for Acura Integra is now completed',
              time: '5 minutes ago',
              isUnread: true,
              icon: Icons.build_circle,
              color: AppTheme.primaryGreen,
            ),
            _buildNotificationItem(
              title: 'Maintenance Reminder',
              message: 'Oil change due for your Audi A5 in 500 KM',
              time: '2 hours ago',
              isUnread: true,
              icon: Icons.warning_amber,
              color: Colors.orange,
            ),
            _buildNotificationItem(
              title: 'Payment Confirmation',
              message:
                  'Payment of ₦45,000 for brake service has been processed',
              time: '1 day ago',
              isUnread: false,
              icon: Icons.payment,
              color: Colors.blue,
            ),
            _buildNotificationItem(
              title: 'New Mechanic Available',
              message: 'A qualified mechanic is now available in your area',
              time: '2 days ago',
              isUnread: false,
              icon: Icons.person_add,
              color: AppTheme.primaryGreen,
            ),
            _buildNotificationItem(
              title: 'Service Completed',
              message: 'Oil change for Audi A5 has been successfully completed',
              time: '3 days ago',
              isUnread: false,
              icon: Icons.check_circle,
              color: AppTheme.primaryGreen,
            ),
            _buildNotificationItem(
              title: 'Appointment Scheduled',
              message:
                  'Your service appointment has been confirmed for tomorrow',
              time: '1 week ago',
              isUnread: false,
              icon: Icons.schedule,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppTheme.lightGreen.withOpacity(0.3) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              isUnread
                  ? AppTheme.primaryGreen.withOpacity(0.2)
                  : Colors.grey[200]!,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight:
                              isUnread ? FontWeight.w600 : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppTheme.primaryGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[500], fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
