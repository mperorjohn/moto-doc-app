import 'package:flutter/material.dart';
import '../widgets/vehicle_card.dart';
import '../components/add_vehicle_modal.dart';

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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AddVehicleModal(),
                  );
                },
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
