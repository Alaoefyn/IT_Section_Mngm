import 'package:flutter/material.dart';

class ActiveJobsPage extends StatefulWidget {
  const ActiveJobsPage({Key? key}) : super(key: key);

  @override
  _ActiveJobsPageState createState() => _ActiveJobsPageState();
}

class _ActiveJobsPageState extends State<ActiveJobsPage> {
  // Hardcoded sample data
  List<Map<String, dynamic>> _activeJobs = [
    {'jobName': 'Network Upgrade', 'assignedTo': 'John Doe'},
    {'jobName': 'Database Optimization', 'assignedTo': 'Jane Smith'},
    {'jobName': 'Software Installation', 'assignedTo': 'Alice Johnson'},
  ];

  void _addNewActiveJob() {
    // Logic to add a new active job can be added here
    setState(() {
      _activeJobs.add({
        'jobName': 'System Backup',
        'assignedTo': 'Bob Brown',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Jobs'),
      ),
      body: ListView.builder(
        itemCount: _activeJobs.length,
        itemBuilder: (context, index) {
          final item = _activeJobs[index];
          return ListTile(
            title: Text('Job: ${item['jobName']}'),
            subtitle: Text('Assigned To: ${item['assignedTo']}'),
            leading: const Icon(Icons.work, color: Colors.green),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewActiveJob,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
