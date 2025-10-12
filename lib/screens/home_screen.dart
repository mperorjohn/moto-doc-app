import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import '../widgets/vehicle_card.dart';
import '../widgets/service_request_card.dart';
import '../theme/app_theme.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const VehiclesPage(),
    const RequestsPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.greenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.build, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            const Text('MotoDoc'),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3; // Navigate to notifications page
                  });
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const CircleAvatar(radius: 16, child: Icon(Icons.person, size: 20)),
          const SizedBox(width: 16),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_outlined),
            activeIcon: Icon(Icons.directions_car),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build_outlined),
            activeIcon: Icon(Icons.build),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.notifications_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(Icons.circle, size: 8, color: Colors.red),
                ),
              ],
            ),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back, Kayode Owoseni!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Here's what's happening with your vehicles today.",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'My Vehicles',
                  value: '2',
                  icon: Icons.directions_car,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Active Requests',
                  value: '0',
                  icon: Icons.build_circle,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'Total Spent',
                  value: 'CO',
                  icon: Icons.attach_money,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: 'Completed Requests',
                  value: '0',
                  icon: Icons.check_circle,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Vehicles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('View All')),
            ],
          ),
          const SizedBox(height: 16),
          const VehicleCard(
            name: 'Acura Integra',
            status: 'Active',
            year: '2024',
            mileage: '45,000KM',
          ),
          const SizedBox(height: 12),
          const VehicleCard(
            name: 'Audi A5',
            status: 'Active',
            year: '2021',
            mileage: '113,000KM',
          ),
        ],
      ),
    );
  }
}

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Vehicles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Vehicle'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const VehicleCard(
            name: 'Acura Integra',
            status: 'Active',
            year: '2024',
            mileage: '45,000KM',
          ),
          const SizedBox(height: 12),
          const VehicleCard(
            name: 'Audi A5',
            status: 'Active',
            year: '2021',
            mileage: '113,000KM',
          ),
        ],
      ),
    );
  }
}

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Requests',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('New Request'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Active Requests',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ServiceRequestCard(
            type: 'Brake Service',
            vehicle: 'Acura Integra',
            date: 'Oct 15, 2024',
            status: 'In Progress',
          ),
          const SizedBox(height: 24),
          const Text(
            'Recent Maintenance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ServiceRequestCard(
            type: 'Brake Service',
            vehicle: 'Acura Integra',
            date: 'Oct 15, 2024',
            status: 'Completed',
          ),
          const ServiceRequestCard(
            type: 'Oil Change',
            vehicle: 'Audi A5',
            date: 'Oct 10, 2024',
            status: 'Completed',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Kayode Owoseni',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'kayode@example.com',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildProfileOption(Icons.person_outline, 'Edit Profile'),
          _buildProfileOption(Icons.settings_outlined, 'Settings'),
          _buildProfileOption(Icons.help_outline, 'Help & Support'),
          _buildProfileOption(Icons.logout, 'Logout', isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    IconData icon,
    String title, {
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : AppTheme.darkGrey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text('Mark All Read')),
            ],
          ),
          const SizedBox(height: 24),
          _buildNotificationItem(
            title: 'Service Request Update',
            message: 'Your brake service for Acura Integra is now completed',
            time: '5 minutes ago',
            isUnread: true,
            icon: Icons.build_circle,
            color: AppTheme.greenAccent,
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
            message: 'Payment of ₦45,000 for brake service has been processed',
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
            color: AppTheme.primaryPurple,
          ),
          _buildNotificationItem(
            title: 'Service Completed',
            message: 'Oil change for Audi A5 has been successfully completed',
            time: '3 days ago',
            isUnread: false,
            icon: Icons.check_circle,
            color: AppTheme.greenAccent,
          ),
          _buildNotificationItem(
            title: 'Appointment Scheduled',
            message: 'Your service appointment has been confirmed for tomorrow',
            time: '1 week ago',
            isUnread: false,
            icon: Icons.schedule,
            color: Colors.grey,
          ),
        ],
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
        color: isUnread ? AppTheme.lightPurple.withOpacity(0.3) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              isUnread
                  ? AppTheme.primaryPurple.withOpacity(0.2)
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
                          color: AppTheme.primaryPurple,
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
