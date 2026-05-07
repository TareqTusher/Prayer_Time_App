import 'dart:async'; // ✅ add this
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times_app/presentation/widgets/prayer_list.dart';

class PrayerTimeSection extends StatefulWidget {
  const PrayerTimeSection({super.key});

  @override
  State<PrayerTimeSection> createState() => _PrayerTimeSectionState();
}

class _PrayerTimeSectionState extends State<PrayerTimeSection> {
  int selectedIndex = 0;
  Timer? timer;

  List<PrayerModel> prayers = [
    PrayerModel("Fajr", "05:00 AM"),
    PrayerModel("Dhuhr", "01:15 PM"),
    PrayerModel("Asr", "04:45 PM"),
    PrayerModel("Maghrib", "06:30 PM"),
    PrayerModel("Isha", "08:00 PM"),
  ];

  @override
  void initState() {
    super.initState();
    updateNextPrayer();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateNextPrayer();
    }); 
  }

  void updateNextPrayer() {
    int newIndex = getNextPrayerIndex();

    if (newIndex != selectedIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
    }
  }

  int getNextPrayerIndex() {
    DateTime now = DateTime.now();

    for (int i = 0; i < prayers.length; i++) {
      DateTime prayerTime = DateFormat("hh:mm a").parse(prayers[i].time);
      print("prayerTime $prayerTime}");
      print("Prayer time2 ${prayers[i].time}");
      print("Prayer time3 ${prayers[i]}");

      DateTime fullTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );
      print("Full Time $fullTime");
      if (now.isBefore(fullTime)) {
        return i;
      }
      print("i $i");
    }
    return 0;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 0.0),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                color: Colors.red,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.teal.shade50
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Image.asset(
                                PrayerList.images[index],
                                color: Colors.amber,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              prayers[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: prayers[index].time,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 1);
          },
          itemCount: prayers.length,
        ),
      ),
    );
  }
}

class PrayerModel {
  final String name;
  final String time;

  PrayerModel(this.name, this.time);
}
