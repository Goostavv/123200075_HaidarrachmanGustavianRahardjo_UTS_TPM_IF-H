import 'package:flutter/material.dart';
import 'package:utstpmtest/bangundatar/cylinder.dart';
import 'package:utstpmtest/login_page.dart';
import 'dart:math';



class Trapezium extends StatefulWidget {
  @override
  State<Trapezium> createState() => _TrapeziumState();
}


class _TrapeziumState extends State<Trapezium> {
  double topSide = 0, bottomSide = 0, height = 0, area = 0, perimeter = 0;

  final TextEditingController topSideController =
  TextEditingController(text: "");
  final TextEditingController bottomSideController =
  TextEditingController(text: "");
  final TextEditingController heightController =
  TextEditingController(text: "");

  void calculate() {
    setState(() {
      topSide = double.parse(topSideController.text);
      bottomSide = double.parse(bottomSideController.text);
      height = double.parse(heightController.text);
      area = ((topSide + bottomSide) * height) / 2;
      perimeter = topSide + bottomSide + 2 * sqrt(pow(height, 2) + pow(((bottomSide - topSide) / 2), 2));
    });
  }

  void clear() {
    setState(() {
      topSideController.text = "";
      bottomSideController.text = "";
      heightController.text = "";
      area = 0;
      perimeter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trapezium Calculator"),
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
                controller: topSideController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Top Side',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              alignment: Alignment.center,
              width: 250,
              child: TextField(
                controller: bottomSideController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bottom Side',
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
            Text("Perimeter : $perimeter",
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            const SizedBox(height: 10),
            Text("Area : $area",
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
                const SizedBox(width: 10),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        // LandingPage
                        MaterialPageRoute(
                            builder: (context) => CalculateCylinder()
                        ),
                      );
                    },
                    child: const Text('Tube Calculator',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}