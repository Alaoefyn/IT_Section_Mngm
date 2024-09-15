//active_repairs.dart

import 'package:flutter/material.dart';
import '../database_helper.dart';

class ActiveRepairsPage extends StatefulWidget {
  const ActiveRepairsPage({Key? key}) : super(key: key);

  @override
  _ActiveRepairsPageState createState() => _ActiveRepairsPageState();
}

class _ActiveRepairsPageState extends State<ActiveRepairsPage> {
  List<Map<String, dynamic>> _repairs = [];

  @override
  void initState() {
    super.initState();
    _loadRepairs();
  }

  Future<void> _loadRepairs() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query('repairs', where: 'status = ?', whereArgs: ['active']);
    setState(() {
      _repairs = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Repairs'),
      ),
      body: _repairs.isEmpty
          ? const Center(child: Text('No active repairs.'))
          : ListView.builder(
              itemCount: _repairs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_repairs[index]['title']),
                  subtitle: Text('Assigned to: ${_repairs[index]['assigned_to']}'),
                );
              },
            ),
    );
  }
}
