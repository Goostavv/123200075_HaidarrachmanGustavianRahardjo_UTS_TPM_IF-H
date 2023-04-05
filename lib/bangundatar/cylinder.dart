import 'package:flutter/material.dart';
import 'dart:math';

import 'package:utstpmtest/login_page.dart';

class CalculateCylinder extends StatefulWidget {
  @override
  _CalculateCylinderState createState() => _CalculateCylinderState();
}

class _CalculateCylinderState extends State<CalculateCylinder> {
  double radius = 0, height = 0, area = 0, perimeter = 0;

  final TextEditingController radiusController =
  TextEditingController(text: "");
  final TextEditingController heightController =
  TextEditingController(text: "");

  void calculate() {
    setState(() {
      radius = double.parse(radiusController.text);
      height = double.parse(heightController.text);
      area = 2 * pi * radius * (radius + height);
      perimeter = 2 * pi * radius;
    });
  }

  void clear() {
    setState(() {
      radiusController.text = "";
      heightController.text = "";
      area = 0;
      perimeter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cylinder Calculator"),
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              width: 250,
              child: TextField(
                controller: radiusController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Radius',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              alignment: Alignment.center,
              width: 250,
              child: TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Perimeter : $perimeter",
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            const SizedBox(height: 10),
            Text(
              "Area : $area",
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: calculate,
                  child: const Text("Calculate"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: clear,
                  child: const Text("Clear"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}