import 'package:flutter/material.dart';

class FinishedJobsPage extends StatefulWidget {
  const FinishedJobsPage({Key? key}) : super(key: key);

  @override
  _FinishedJobsPageState createState() => _FinishedJobsPageState();
}

class _FinishedJobsPageState extends State<FinishedJobsPage> {
  // Hardcoded sample data
  List<Map<String, dynamic>> _finishedJobs = [
    {'jobName': 'Server Setup', 'assignedTo': 'Mark Green'},
    {'jobName': 'Data Migration', 'assignedTo': 'Lucy Gray'},
    {'jobName': 'Security Audit', 'assignedTo': 'Emma White'},
  ];

  void _addNewFinishedJob() {
    // Logic to add a new finished job can be added here
    setState(() {
      _finishedJobs.add({
        'jobName': 'System Upgrade',
        'assignedTo': 'David Black',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finished Jobs'),
      ),
      body: ListView.builder(
        itemCount: _finishedJobs.length,
        itemBuilder: (context, index) {
          final item = _finishedJobs[index];
          return ListTile(
            title: Text('Job: ${item['jobName']}'),
            subtitle: Text('Completed By: ${item['assignedTo']}'),
            leading: const Icon(Icons.check_circle, color: Colors.blue),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewFinishedJob,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
