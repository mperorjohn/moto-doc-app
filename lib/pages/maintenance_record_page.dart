import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MaintenanceRecordPage extends StatefulWidget {
  const MaintenanceRecordPage({super.key});

  @override
  State<MaintenanceRecordPage> createState() => _MaintenanceRecordPageState();
}

class _MaintenanceRecordPageState extends State<MaintenanceRecordPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Dummy data with new fields
  final List<Map<String, dynamic>> _records = [
    {
      'id': '1',
      'recordType': 'Repair',
      'service': 'Oil Change',
      'vehicle': 'Audi Weiweo 2016',
      'mechanic': 'AutoFix Garage',
      'cost': '€50.00',
      'status': 'Completed',
      'paymentStatus': 'Paid',
      'date': 'Oct 24, 2023',
    },
    {
      'id': '2',
      'recordType': 'Maintenance',
      'service': 'Brake Pad Replacement',
      'vehicle': 'Audi Weiweo 2016',
      'mechanic': 'QuickStop Mechanics',
      'cost': '€120.00',
      'status': 'Completed',
      'paymentStatus': 'Paid',
      'date': 'Sep 15, 2023',
    },
    {
      'id': '3',
      'recordType': 'Inspection',
      'service': 'General Inspection',
      'vehicle': 'Toyota Camry 2020',
      'mechanic': 'Official Dealer',
      'cost': '€80.00',
      'status': 'Completed',
      'paymentStatus': 'Pending',
      'date': 'Aug 02, 2023',
    },
    {
      'id': '4',
      'recordType': 'Maintenance',
      'service': 'Tire Rotation',
      'vehicle': 'Toyota Camry 2020',
      'mechanic': 'Tire Plus',
      'cost': '€30.00',
      'status': 'Processing',
      'paymentStatus': 'Unpaid',
      'date': 'Jul 10, 2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                         Expanded(child: _buildDropdown('Record Type', 'All Types')),
                         const SizedBox(width: 16),
                         Expanded(child: _buildDropdown('Status', 'All Status')),
                         const SizedBox(width: 16),
                         Expanded(child: _buildDropdown('Payment Status', 'All Payment Status')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.search, size: 16),
                          label: const Text('Search'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.refresh, size: 16),
                          label: const Text('Clear'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey,
                             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Table Section
              Container(
                width: double.infinity,
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(Colors.grey[50]),
                      columns: const [
                        DataColumn(label: Text('#', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('RECORD TYPE', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('SERVICE TYPE', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('VEHICLE', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('MECHANIC', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('COST', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('STATUS', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('PAYMENT STATUS', style: TextStyle(fontWeight: FontWeight.bold))),
                         DataColumn(label: Text('DATE', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('ACTIONS', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: _records.map((record) => DataRow(
                        cells: [
                          DataCell(Text(record['id'])),
                          DataCell(Text(record['recordType'])),
                          DataCell(Text(record['service'])),
                          DataCell(Text(record['vehicle'])),
                          DataCell(Text(record['mechanic'])),
                           DataCell(Text(record['cost'], style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryGreen))),
                          DataCell(_buildStatusBadge(record['status'])),
                           DataCell(_buildPaymentStatusBadge(record['paymentStatus'])),
                          DataCell(Text(record['date'])),
                          DataCell(
                            Row(
                              children: [
                                IconButton(icon: const Icon(Icons.visibility, size: 18, color: Colors.blue), onPressed: () {}),
                                IconButton(icon: const Icon(Icons.download, size: 18, color: Colors.grey), onPressed: () {}),
                              ],
                            )
                          ),
                        ],
                      )).toList(),
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500)),
         const SizedBox(height: 4),
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
           decoration: BoxDecoration(
             border: Border.all(color: Colors.grey[300]!),
             borderRadius: BorderRadius.circular(4),
           ),
           child: DropdownButtonHideUnderline(
             child: DropdownButton<String>(
               value: value,
               isExpanded: true,
               icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
               items: [
                 DropdownMenuItem(value: value, child: Text(value, style: const TextStyle(fontSize: 14))),
               ],
               onChanged: (val) {},
             ),
           ),
         ),
       ],
     );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    Color bgColor;

    switch (status.toLowerCase()) {
      case 'completed':
        color = Colors.green;
        bgColor = Colors.green.withOpacity(0.1);
        break;
      case 'processing':
        color = Colors.orange;
        bgColor = Colors.orange.withOpacity(0.1);
        break;
      default:
        color = Colors.grey;
        bgColor = Colors.grey.withOpacity(0.1);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

   Widget _buildPaymentStatusBadge(String status) {
    Color color;
    Color bgColor;

    switch (status.toLowerCase()) {
      case 'paid':
        color = Colors.green;
        bgColor = Colors.green.withOpacity(0.1);
        break;
      case 'pending':
        color = Colors.orange;
        bgColor = Colors.orange.withOpacity(0.1);
        break;
      case 'unpaid':
         color = Colors.red;
        bgColor = Colors.red.withOpacity(0.1);
        break;
      default:
        color = Colors.grey;
        bgColor = Colors.grey.withOpacity(0.1);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
