import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  String date = DateFormat("EEEE, d MMMM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Prayer Times",
          style: TextStyle(
      
            
            fontSize: 40,
            fontWeight: FontWeight.w500,
            foreground: Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.teal,
          Colors.orange,
        ],
      ).createShader(
        Rect.fromLTWH(100, 70, 200, 70),
      ),
          ),
        ),
        Text(
          "Dhaka Bangladesh",
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("15 Shawwal 1448 ", style: TextStyle(fontSize: 14)),
        Text(date, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
