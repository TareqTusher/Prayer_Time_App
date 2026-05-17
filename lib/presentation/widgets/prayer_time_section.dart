import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times_app/controller/network_caller.dart';
import 'package:prayer_times_app/controller/urls.dart';
import 'package:prayer_times_app/model/time_prayer_model.dart';
import 'package:prayer_times_app/presentation/widgets/prayer_list.dart';

class PrayerTimeSection extends StatefulWidget {
  const PrayerTimeSection({super.key});

  @override
  State<PrayerTimeSection> createState() => _PrayerTimeSectionState();
}

class _PrayerTimeSectionState extends State<PrayerTimeSection> {
  int selectedIndex = 0;

  Timer? timer;

  bool inProgress = false;

  TimePrayerModel? timePrayerModel;

  List<PrayerModel> prayers = [];

  @override
  void initState() {
    super.initState();

    getPrayerTime();

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateNextPrayer();
    });
  }

  Future<void> getPrayerTime() async {
    inProgress = true;

    setState(() {});

    String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

    final response = await NetworkCaller().getRequest(
      Urls.prayerTimeUrl(currentDate),
    );

    if (response.isSuccess) {
      final json = response.jsonResponse;

      timePrayerModel = TimePrayerModel(
        code: json['code'],
        status: json['status'],
        data: Data(
          timings: Timings(
            fajr: json['data']['timings']['Fajr'],
            dhuhr: json['data']['timings']['Dhuhr'],
            asr: json['data']['timings']['Asr'],
            maghrib: json['data']['timings']['Maghrib'],
            isha: json['data']['timings']['Isha'],
          ),
        ),
      );

      prayers = [
        PrayerModel("Fajr", timePrayerModel?.data?.timings?.fajr ?? ""),

        PrayerModel("Dhuhr", timePrayerModel?.data?.timings?.dhuhr ?? ""),

        PrayerModel("Asr", timePrayerModel?.data?.timings?.asr ?? ""),

        PrayerModel("Maghrib", timePrayerModel?.data?.timings?.maghrib ?? ""),

        PrayerModel("Isha", timePrayerModel?.data?.timings?.isha ?? ""),
      ];

      updateNextPrayer();
    }

    inProgress = false;

    setState(() {});
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
      DateTime prayerTime = DateFormat("HH:mm").parse(prayers[i].time.trim());
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

    return 0;
  }

  String formatTime(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);

    return DateFormat("hh:mm a").format(dateTime);
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (inProgress) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),

        child: ListView.separated(
          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },

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

                      Text(
                        formatTime(prayers[index].time),

                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

          separatorBuilder: (context, index) {
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
