import 'package:flutter/material.dart';
import 'package:prayer_times_app/presentation/widgets/header_section.dart';
import 'package:prayer_times_app/presentation/widgets/prayer_time_section.dart';
import 'package:prayer_times_app/presentation/widgets/time_section.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  HeaderSection(),
                  SizedBox(height: 12),
                  TimeSection(),
                  SizedBox(height: 12),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Color(0xFF1ABC9C), Color(0xFF16A085)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Prayer",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 4),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fazar",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "5 May 2026",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Icon(Icons.sunny, size: 40, color: Colors.amber),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                  PrayerTimeSection(),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.teal.shade50,
          child: Text(
            "Created by Md Tariqul Islam",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
