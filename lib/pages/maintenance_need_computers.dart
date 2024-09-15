import 'package:flutter/material.dart';

class MaintenanceNeedComputersPage extends StatefulWidget {
  const MaintenanceNeedComputersPage({Key? key}) : super(key: key);

  @override
  _MaintenanceNeedComputersPageState createState() => _MaintenanceNeedComputersPageState();
}

class _MaintenanceNeedComputersPageState extends State<MaintenanceNeedComputersPage> {
  // Sample data for maintenance
  List<Map<String, dynamic>> _maintenanceList = [
    {'issueDescription': 'Overheating issue', 'reportedDate': '2024-08-01'},
    {'issueDescription': 'Screen flickering', 'reportedDate': '2024-08-15'},
    {'issueDescription': 'Battery replacement needed', 'reportedDate': '2024-08-20'},
  ];

  void _addNewMaintenanceNeed() {
    // Logic to add a new maintenance need computer can be added here
    setState(() {
      _maintenanceList.add({
        'issueDescription': 'New issue reported',
        'reportedDate': '2024-08-29',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Need Computers'),
      ),
      body: ListView.builder(
        itemCount: _maintenanceList.length,
        itemBuilder: (context, index) {
          final item = _maintenanceList[index];
          return ListTile(
            title: Text('Issue: ${item['issueDescription']}'),
            subtitle: Text('Reported Date: ${item['reportedDate']}'),
            leading: const Icon(Icons.report_problem, color: Colors.orange),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewMaintenanceNeed,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
