import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Device',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.devices),
          label: 'Device Inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build),
          label: 'Fixed Components',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'User Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.build),
          label: 'Fixed Components',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'User Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
