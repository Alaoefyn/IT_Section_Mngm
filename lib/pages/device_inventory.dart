//device_inventory.dart

import 'package:flutter/material.dart';
import '../database_helper.dart';

class DeviceInventoryPage extends StatefulWidget {
  const DeviceInventoryPage({Key? key}) : super(key: key);

  @override
  _DeviceInventoryPageState createState() => _DeviceInventoryPageState();
}

class _DeviceInventoryPageState extends State<DeviceInventoryPage> {
  List<Map<String, dynamic>> _devices = [];

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  Future<void> _loadDevices() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query('devices');
    setState(() {
      _devices = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Inventory'),
      ),
      body: _devices.isEmpty
          ? const Center(child: Text('No devices found.'))
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_devices[index]['name']),
                  subtitle: Text('Serial Number: ${_devices[index]['serial_number']}'),
                );
              },
            ),
    );
  }
}
