
import 'package:flutter/material.dart';
import 'package:prayer_times_app/presentation/screens/app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D5C46), Color(0xFF0A3F32)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),

              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "SalahMate",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Mosque Illustration Placeholder
                  Image.asset(
                    "assets/mosque.png", // add your image here
                    height: 220,
                  ),
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

                    const Text(
                      "Stay Connected\nwith Salah",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Never miss a prayer. Get accurate prayer times based on your location.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),

                    const SizedBox(height: 24),

   InkWell(
    borderRadius: BorderRadius.circular(30),
    onTap: (){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>AppScreen()));
    },
     child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(Icons.play_arrow,color: Color(0xFF0D5C46),size: 20,),
          Text("Start Now",style: TextStyle(color: Color(0xFF0D5C46)),)
        ],),
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
    );
  }
}
