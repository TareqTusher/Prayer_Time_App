import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSection extends StatefulWidget {
  const TimeSection({super.key});

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  String time = "";

  @override
  void initState() {
    super.initState();
    updateTime();
    Timer.periodic(Duration(seconds: 1), (t) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      time = DateFormat("hh:mm:ss a").format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "Current Time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(fontSize: 40, color: Colors.green.shade900),
          ),
        ],
      ),
    );
  }
}
