import 'package:flutter/material.dart';
import '../widgets/service_request_card.dart';

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
