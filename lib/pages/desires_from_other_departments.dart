import 'package:flutter/material.dart';

class DesiresFromOtherDepartmentsPage extends StatefulWidget {
  const DesiresFromOtherDepartmentsPage({Key? key}) : super(key: key);

  @override
  _DesiresFromOtherDepartmentsPageState createState() => _DesiresFromOtherDepartmentsPageState();
}

class _DesiresFromOtherDepartmentsPageState extends State<DesiresFromOtherDepartmentsPage> {
  // Hardcoded sample data
  List<Map<String, dynamic>> _desiresList = [
    {'departmentName': 'HR', 'desireDescription': 'New computers for HR staff'},
    {'departmentName': 'Marketing', 'desireDescription': 'Update software licenses'},
    {'departmentName': 'Engineering', 'desireDescription': 'More powerful workstations'},
  ];

  void _addNewDesire() {
    // Logic to add a new desire can be added here
    setState(() {
      _desiresList.add({
        'departmentName': 'Finance',
        'desireDescription': 'Upgrade financial software',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desires From Other Departments'),
      ),
      body: ListView.builder(
        itemCount: _desiresList.length,
        itemBuilder: (context, index) {
          final item = _desiresList[index];
          return ListTile(
            title: Text('Department: ${item['departmentName']}'),
            subtitle: Text('Desire: ${item['desireDescription']}'),
            leading: const Icon(Icons.comment, color: Colors.orange),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewDesire,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
