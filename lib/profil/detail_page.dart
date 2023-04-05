import 'package:flutter/material.dart';
import 'package:utstpmtest/login_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget _title() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10,40,10,20),
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

    Widget _detail() {
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/foto.jpg'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Student Number'),
              subtitle: Text('123200075'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('Haidarrachman Gustavian Rahardjo'),
            ),
            ListTile(
              leading: Icon(Icons.class__outlined),
              title: Text('Class'),
              subtitle: Text('IF-H'),
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Place of Birth and Date of Birth'),
              subtitle: Text('Semarang, 28 August 2002'),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text('Hope/Future Dream'),
              subtitle: Text('To Protect My Loved Ones in My Own Way'),
            ),
            SizedBox(height: 30),
          ],
        ),
      );
    }

    Widget _Profil() {
      return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _title(),
          _detail(),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DETAILED PROFILE'),
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
      body: _Profil(),
    );
  }
}
