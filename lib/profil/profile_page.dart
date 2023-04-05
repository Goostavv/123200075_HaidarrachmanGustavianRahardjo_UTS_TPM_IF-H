import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:utstpmtest/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
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
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _title(),
          CircleAvatar(
            radius: 80,
            child: Image.asset(
              'images/fotolagi.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Haidarrachman Gustavian Rahardjo',
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            '123200075',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          _detailButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
      child: Center(
        child: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _detailButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
            ),
          );
        },
        child: Text('Detailed Profile Info'),
      ),
    );
  }
}
