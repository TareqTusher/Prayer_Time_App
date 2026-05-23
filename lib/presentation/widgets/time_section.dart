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
      boxShadow: [
        BoxShadow(color: Colors.grey,
        
        blurRadius: 5,
        spreadRadius: 0.0
        
        )
      ],
        borderRadius: BorderRadius.circular(12),
    
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
  // Future<void> getPrayerTime() async {
  //   inProgress = true;

  //   setState(() {});

  //   String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  //   final response = await NetworkCaller().getRequest(
  //     Urls.prayerTimeUrl(currentDate),
  //   );

  //   if (response.isSuccess) {
  //     final json = response.jsonResponse;

  //     timePrayerModel = PrayerTimeModel(
  //       code: json['code'],
  //       status: json['status'],
  //       data: Data(
  //         timings: Timings(
  //           fajr: json['data']['timings']['Fajr'],
  //           dhuhr: json['data']['timings']['Dhuhr'],
  //           asr: json['data']['timings']['Asr'],
  //           maghrib: json['data']['timings']['Maghrib'],
  //           isha: json['data']['timings']['Isha'],
  //         ),
  //       ),
  //     );

  //     prayers = [
  //       PrayerModel("Fajr", timePrayerModel?.data?.timings?.fajr ?? ""),

  //       PrayerModel("Dhuhr", timePrayerModel?.data?.timings?.dhuhr ?? ""),

  //       PrayerModel("Asr", timePrayerModel?.data?.timings?.asr ?? ""),

  //       PrayerModel("Maghrib", timePrayerModel?.data?.timings?.maghrib ?? ""),

  //       PrayerModel("Isha", timePrayerModel?.data?.timings?.isha ?? ""),
  //     ];

  //     updateNextPrayer();
  //   }

  //   inProgress = false;

  //   setState(() {});
  // }