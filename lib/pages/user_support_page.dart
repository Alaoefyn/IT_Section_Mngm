import 'package:flutter/material.dart';

class UserSupportPage extends StatefulWidget {
  const UserSupportPage({Key? key}) : super(key: key);

  @override
  _UserSupportPageState createState() => _UserSupportPageState();
}

class _UserSupportPageState extends State<UserSupportPage> {
  // Sample data for support requests
  List<Map<String, dynamic>> _supportRequests = [
    {'issue': 'Cannot access email', 'user_name': 'John Doe'},
    {'issue': 'Computer running slow', 'user_name': 'Jane Smith'},
    {'issue': 'Software installation needed', 'user_name': 'Mike Johnson'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Support'),
      ),
      body: _supportRequests.isEmpty
          ? const Center(child: Text('No support requests found.'))
          : ListView.builder(
              itemCount: _supportRequests.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_supportRequests[index]['issue']),
                  subtitle: Text('User: ${_supportRequests[index]['user_name']}'),
                  leading: const Icon(Icons.support_agent, color: Colors.red),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
    );
  }
}
