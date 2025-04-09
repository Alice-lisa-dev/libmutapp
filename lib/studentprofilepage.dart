import 'package:flutter/material.dart';

void main() => runApp(SchoolLibraryApp());

class SchoolLibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentProfilePage(),
    );
  }
}

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Student Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Preference & User Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit, color: Colors.green[800]),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green[200],
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Student Name', style: TextStyle(fontSize: 16)),
                      Text('student@email.com'),
                      Text('+1234567890'),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.green[700]),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildTextField('Year of Study', 'e.g., 3rd Year'),
            _buildTextField('Preferred Course', 'e.g., Computer Science'),
            _buildTextField('Address', 'Enter your address'),
            _buildTextField('Author\'s Name', 'Favorite Author'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications', style: TextStyle(fontSize: 16)),
                Switch(
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Library Cards', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: [
                _buildLibraryCardButton('Identity Card 1'),
                _buildLibraryCardButton('Identity Card 2'),
                _buildLibraryCardButton('Identity Card 3'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Identification Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.edit, color: Colors.green[800]),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_library), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          decoration: InputDecoration(hintText: hint),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildLibraryCardButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: Text(label),
      ),
    );
  }
}
