import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayer_times_app/presentation/screens/app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF0D5C46)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),
          
                  Column(
                    children: [
                      Text(
                        "SalahMate",
                        style: GoogleFonts.merriweather(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/mosjid.png",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
          
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Color(0xFF0B5D4B), // your background color
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
          
                      const SizedBox(height: 20),
                    ],
                  ),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.nightlight_round,
                          color: Colors.white,
                          size: 28,
                        ),
          
                        const SizedBox(height: 10),
          
                         Text(
                          "Stay Connected\nwith Salah",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
          
                        const SizedBox(height: 10),
          
                         Text(
                          "Never miss a prayer. Get accurate prayer times based on your location.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(fontSize: 14, color: Colors.white70),
                        ),
          
                        const SizedBox(height: 24),
          
                        InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Color(0xFF0D5C46),
                                  size: 20,
                                ),
                                Text(
                                  "Start Now",
                                  style: TextStyle(color: Color(0xFF0D5C46)),
                                ),
                              ],
                            ),
                          ),
                        ),
          
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
