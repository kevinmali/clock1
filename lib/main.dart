import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    color: Colors.black,
    home: clockapp(),
  ));
}

class clockapp extends StatefulWidget {
  State<clockapp> createState() => _clockappState();
}

class _clockappState extends State<clockapp> {
  int h = 0;
  int m = 0;
  int s = 0;

  myClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour;
        m = DateTime.now().minute;
        s = DateTime.now().second;
      });
      myClock();
    });
  }

  @override
  void initState() {
    super.initState();
    myClock();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 20,
      //   elevation: 5,
      //   centerTitle: true,
      //   title: Text("Strck watch"),
      // ),
      body: Center(
        child: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image:
                  AssetImage("assets/images/Screenshot 2023-07-04 163339.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "${h} : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              Text(
                "${m} : ",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              Text(
                "${s} ",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
