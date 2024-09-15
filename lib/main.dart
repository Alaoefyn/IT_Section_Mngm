import 'package:flutter/material.dart';
import 'pages/active_jobs.dart';
import 'pages/desires_from_other_departments.dart';
import 'pages/fixed_components.dart';
import 'pages/maintenance_need_computers.dart';
import 'pages/other_department_equipments.dart';
import 'pages/project_meeting_dates.dart';
import 'pages/user_support_page.dart';
import 'pages/finished_jobs.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Section Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const FixedComponentsPage(),
    const MaintenanceNeedComputersPage(),
    const OtherDepartmentEquipmentsPage(),
    const ProjectMeetingDatesPage(),
    const UserSupportPage(),
    const ActiveJobsPage(),
    const FinishedJobsPage(),
    const DesiresFromOtherDepartmentsPage(),
  ];

  final List<String> _titles = [
    'Fixed Components',
    'Maintenance Need Computers',
    'Other Department Equipments',
    'Project Meeting Dates',
    'User Support',
    'Active Jobs',
    'Finished Jobs',
    'Desires From Other Departments',
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        onTap: _onTabTapped,
      ),
    );
  }
}
