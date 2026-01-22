import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MaintenanceRecordPage extends StatefulWidget {
  const MaintenanceRecordPage({super.key});

  @override
  State<MaintenanceRecordPage> createState() => _MaintenanceRecordPageState();
}

class _MaintenanceRecordPageState extends State<MaintenanceRecordPage> {
  // Dummy data
  final List<Map<String, dynamic>> _records = [
    {
      'date': 'Oct 24, 2023',
      'service': 'Oil Change',
      'vehicle': 'Audi Weiweo 2016',
      'cost': '€50.00',
      'status': 'Completed',
      'shop': 'AutoFix Garage',
    },
    {
      'date': 'Sep 15, 2023',
      'service': 'Brake Pad Replacement',
      'vehicle': 'Audi Weiweo 2016',
      'cost': '€120.00',
      'status': 'Completed',
      'shop': 'QuickStop Mechanics',
    },
    {
      'date': 'Aug 02, 2023',
      'service': 'General Inspection',
      'vehicle': 'Toyota Camry 2020',
      'cost': '€80.00',
      'status': 'Completed',
      'shop': 'Official Dealer',
    },
    {
      'date': 'Jul 10, 2023',
      'service': 'Tire Rotation',
      'vehicle': 'Toyota Camry 2020',
      'cost': '€30.00',
      'status': 'Completed',
      'shop': 'Tire Plus',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light grey background like other pages
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Maintenance Records',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
           IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // TODO: Implement filter
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary / Header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Spent',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '€280.00',
                        style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          
          const SizedBox(height: 16),

          // List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _records.length,
              separatorBuilder: (ctx, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final record = _records[index];
                return _buildRecordCard(record);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordCard(Map<String, dynamic> record) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    record['service'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    record['status'],
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  record['date'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(width: 16),
                Icon(Icons.directions_car, size: 14, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  record['vehicle'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
             const SizedBox(height: 12),
             const Divider(height: 1),
             const SizedBox(height: 12),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Icon(Icons.store, size: 16, color: Colors.grey[500]),
                     const SizedBox(width: 4),
                     Text(
                       record['shop'],
                       style: TextStyle(color: Colors.grey[600], fontSize: 13),
                     ),
                   ],
                 ),
                 Text(
                   record['cost'],
                   style: const TextStyle(
                     color: AppTheme.primaryGreen,
                     fontWeight: FontWeight.bold,
                     fontSize: 16,
                   ),
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}
