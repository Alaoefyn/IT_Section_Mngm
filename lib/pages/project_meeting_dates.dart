import 'package:flutter/material.dart';

class ProjectMeetingDatesPage extends StatefulWidget {
  const ProjectMeetingDatesPage({Key? key}) : super(key: key);

  @override
  _ProjectMeetingDatesPageState createState() => _ProjectMeetingDatesPageState();
}

class _ProjectMeetingDatesPageState extends State<ProjectMeetingDatesPage> {
  // Sample data for meeting dates
  List<Map<String, dynamic>> _meetingDates = [
    {'projectName': 'App Redesign', 'meetingDate': '2024-09-01'},
    {'projectName': 'Marketing Campaign', 'meetingDate': '2024-09-05'},
    {'projectName': 'New Feature Development', 'meetingDate': '2024-09-10'},
  ];

  void _addNewMeetingDate() {
    // Logic to add a new meeting date can be added here
    setState(() {
      _meetingDates.add({
        'projectName': 'Client Presentation',
        'meetingDate': '2024-09-15',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Meeting Dates'),
      ),
      body: ListView.builder(
        itemCount: _meetingDates.length,
        itemBuilder: (context, index) {
          final item = _meetingDates[index];
          return ListTile(
            title: Text('Project: ${item['projectName']}'),
            subtitle: Text('Meeting Date: ${item['meetingDate']}'),
            leading: const Icon(Icons.calendar_today, color: Colors.purple),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewMeetingDate,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
