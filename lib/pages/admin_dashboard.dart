import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';  // Adjusted import path
import 'fixed_components.dart';
import 'maintenance_need_computers.dart';
import 'other_department_equipments.dart';
import 'project_meeting_dates.dart';
import 'user_support_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;

  // List of widgets for different tabs
  final List<Widget> _pages = [
    FixedComponentsPage(),
    MaintenanceNeedComputersPage(),
    OtherDepartmentEquipmentsPage(),
    ProjectMeetingDatesPage(),
    UserSupportPage(),
  ];

  // List of titles for different tabs
  final List<String> _titles = [
    'Fixed Components',
    'Maintenance Need Computers',
    'Department Equipments',
    'Meeting Dates',
    'User Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
