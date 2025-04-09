import 'package:flutter/material.dart';

void main() => runApp(SchoolLibraryApp());

class SchoolLibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library App',
      home: BookUpdatePage(),
      routes: {
        '/profile': (context) => StudentProfilePage(),
      },
    );
  }
}

class BookUpdatePage extends StatelessWidget {
  final List<Map<String, String>> books = List.generate(12, (index) {
    return {
      'title': 'Book Title ${index + 1}',
      'author': 'Author ${index + 1}',
      'image': 'https://via.placeholder.com/50' // Placeholder image
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Library App'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Latest Book Update title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latest Book Update',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Book list
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(books[index]['image']!),
                  title: Text(books[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(books[index]['author']!),
                );
              },
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        onTap: (index) {
          // Add your page navigation logic here
          print('Navigated to tab: $index');
        },
      ),
    );
  }
}

//  Student Profile Page
class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Profile'), backgroundColor: Colors.green),
      body: Center(
        child: Text(
          "Welcome to the Student Profile",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
 