import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  String time = "";
  @override
  
  void initState() {
    super.initState();
    updateTime();
   Timer.periodic(Duration(seconds: 1),(t){

    updateTime();
   } );
  }
void updateTime(){
   setState(() {
      time = DateFormat("hh:mm ss a").format(DateTime.now());
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Prayer Times6tutyu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Dhaka Bangladesh",
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                Text("15 Shawwal 1448 ", style: TextStyle(fontSize: 14)),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text("Current Time", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 12),
                      Text(time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
