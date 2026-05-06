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

    updateNextPrayer(); // ✅ initial set

  
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
      DateTime prayerTime =
          DateFormat("hh:mm a").parse(prayers[i].time);

      DateTime fullTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );

      if (now.isBefore(fullTime)) {
        return i;
      }
    }

    return 0; // next day fajr
  }

  @override
  void dispose() {
    timer?.cancel(); // ✅ important
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
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
              height: 60,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.amber
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                          prayers[index].name, // ✅ dynamic name
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
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: prayers.length,
      ),
    );
  }
}

class PrayerModel {
  final String name;
  final String time;

  PrayerModel(this.name, this.time);
}