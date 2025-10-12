import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import '../widgets/vehicle_card.dart';
import '../widgets/service_request_card.dart';
import '../theme/app_theme.dart';
import '../pages/dashboard_page.dart';
import '../pages/vehicles_page.dart';
import '../pages/requests_page.dart';
import '../pages/notifications_page.dart';
import '../pages/profile_page.dart';
import '../components/logout_dialog.dart';

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
      backgroundColor: Colors.grey[50],
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppTheme.greenAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.build,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'MotoDoc',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Navigation Menu
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // HOME Section
                  _buildSectionHeader('HOME'),
                  _buildDrawerItem(
                    icon: Icons.dashboard,
                    title: 'Dashboard',
                    isSelected: _currentIndex == 0,
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // MAIN Section
                  _buildSectionHeader('MAIN'),
                  _buildDrawerItem(
                    icon: Icons.directions_car,
                    title: 'My Vehicles',
                    isSelected: _currentIndex == 1,
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.search,
                    title: 'Find Mechanics',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.build_circle,
                    title: 'Repair Requests',
                    isSelected: _currentIndex == 2,
                    onTap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // RECORDS Section
                  _buildSectionHeader('RECORDS'),
                  _buildDrawerItem(
                    icon: Icons.subscriptions,
                    title: 'Subscriptions',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.receipt_long,
                    title: 'Invoices',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.history,
                    title: 'Maintenance Records',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 24),

                  // USER Section
                  _buildSectionHeader('USER'),
                  _buildDrawerItem(
                    icon: Icons.person,
                    title: 'Profile',
                    isSelected: _currentIndex == 4,
                    onTap: () {
                      setState(() {
                        _currentIndex = 4;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    isDestructive: true,
                    onTap: () {
                      Navigator.pop(context);
                      _showLogoutDialog();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[500],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    bool isSelected = false,
    bool isDestructive = false,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color:
              isDestructive
                  ? Colors.red
                  : isSelected
                  ? AppTheme.primaryPurple
                  : Colors.grey[600],
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            color:
                isDestructive
                    ? Colors.red
                    : isSelected
                    ? AppTheme.primaryPurple
                    : Colors.grey[800],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 14,
          ),
        ),
        selected: isSelected && !isDestructive,
        selectedTileColor: AppTheme.primaryPurple.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog() {
    LogoutDialog.show(context);
  }
}
