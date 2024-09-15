import 'package:flutter/material.dart';

class FixedComponentsPage extends StatefulWidget {
  const FixedComponentsPage({Key? key}) : super(key: key);

  @override
  _FixedComponentsPageState createState() => _FixedComponentsPageState();
}

class _FixedComponentsPageState extends State<FixedComponentsPage> {
  // Sample data for fixed components
  List<Map<String, dynamic>> _fixedComponents = [
    {'name': 'Hard Drive', 'id': '1'},
    {'name': 'Graphics Card', 'id': '2'},
    {'name': 'RAM Module', 'id': '3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Components'),
      ),
      body: _fixedComponents.isEmpty
          ? const Center(child: Text('No fixed components found.'))
          : ListView.builder(
              itemCount: _fixedComponents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_fixedComponents[index]['name']),
                  subtitle: Text('ID: ${_fixedComponents[index]['id']}'),
                  leading: const Icon(Icons.build, color: Colors.green),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
    );
  }
}
