//component_inventory.dart

import 'package:flutter/material.dart';
import '../database_helper.dart';

class ComponentInventoryPage extends StatefulWidget {
  const ComponentInventoryPage({Key? key}) : super(key: key);

  @override
  _ComponentInventoryPageState createState() => _ComponentInventoryPageState();
}

class _ComponentInventoryPageState extends State<ComponentInventoryPage> {
  List<Map<String, dynamic>> _components = [];

  @override
  void initState() {
    super.initState();
    _loadComponents();
  }

  Future<void> _loadComponents() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query('components');
    setState(() {
      _components = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component Inventory'),
      ),
      body: _components.isEmpty
          ? const Center(child: Text('No components found.'))
          : ListView.builder(
              itemCount: _components.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_components[index]['name']),
                  subtitle: Text('ID: ${_components[index]['id']}'),
                );
              },
            ),
    );
  }
}
