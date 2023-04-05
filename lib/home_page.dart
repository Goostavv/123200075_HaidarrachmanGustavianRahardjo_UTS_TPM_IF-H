import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:utstpmtest/login_page.dart';
import 'package:utstpmtest/profil/profile_page.dart';
import 'profil/profile_page.dart';
import 'bangundatar/trapezium.dart';
import 'kalender/calendar.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _image() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      width: 260.0,
      child: Image.asset('images/home.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          child: Center(
            child: Column(
              children: [
                _image(),
                SizedBox(height: 10),
                Text(
                  "Hello ${widget.username}\nWelcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 24),
                Text("Menu"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87, // set the color of the selected icon
        unselectedItemColor: Colors.black87, // set the color of the unselected icons
        onTap: (value) {
          if (value == 0)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Trapezium()),
            );
          if (value == 1)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => kalender()),
            );
          if (value == 2)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.details_sharp),
            label: 'CALCULATOR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api_sharp),
            label: 'CALENDAR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}