import 'package:flutter/material.dart';

class OtherDepartmentEquipmentsPage extends StatefulWidget {
  const OtherDepartmentEquipmentsPage({Key? key}) : super(key: key);

  @override
  _OtherDepartmentEquipmentsPageState createState() => _OtherDepartmentEquipmentsPageState();
}

class _OtherDepartmentEquipmentsPageState extends State<OtherDepartmentEquipmentsPage> {
  // Sample data for other department equipment
  List<Map<String, dynamic>> _equipments = [
    {'name': 'Projector', 'department': 'HR'},
    {'name': 'Laptop', 'department': 'Finance'},
    {'name': 'Printer', 'department': 'Marketing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Department Equipments'),
      ),
      body: _equipments.isEmpty
          ? const Center(child: Text('No equipment found.'))
          : ListView.builder(
              itemCount: _equipments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_equipments[index]['name']),
                  subtitle: Text('Department: ${_equipments[index]['department']}'),
                  leading: const Icon(Icons.devices, color: Colors.blue),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
    );
  }
}
