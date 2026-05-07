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

<<<<<<< HEAD
=======
    updateNextPrayer();

>>>>>>> 2f2f04a53c93173c0e1d1910c4de25e8579948f4
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
<<<<<<< HEAD
    return 0; 
=======

    return 0;
>>>>>>> 2f2f04a53c93173c0e1d1910c4de25e8579948f4
  }

  @override
  void dispose() {
<<<<<<< HEAD
    timer?.cancel(); 
=======
    timer?.cancel();
>>>>>>> 2f2f04a53c93173c0e1d1910c4de25e8579948f4
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.zero,
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.zero,
                height: 80,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.teal.shade50
                      : Colors.white,
                      borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
>>>>>>> 2f2f04a53c93173c0e1d1910c4de25e8579948f4
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
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 1,
            );
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
