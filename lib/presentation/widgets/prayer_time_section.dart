import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times_app/controller/network_caller.dart';
import 'package:prayer_times_app/controller/network_response.dart';
import 'package:prayer_times_app/controller/urls.dart';
import 'package:prayer_times_app/model/prayer_model.dart';
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

  PrayerTimeModel? timePrayerModel;

  List<PrayerModel> prayers = [];

  @override
  void initState() {
    super.initState();

    //getPrayerTime();
    prayerTime();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateNextPrayer();
    });
  }




Future<void> prayerTime() async {
  inProgress = true;
  setState(() {});

  log("Check");

  final String now = DateFormat('dd-MM-yyyy').format(DateTime.now());

  final NetworkResponse response = await NetworkCaller().getRequest(
    Urls.prayerTimeUrl(now),
  );

  if (response.isSuccess) {
    timePrayerModel = PrayerTimeModel.fromJson(response.jsonResponse);
    log(timePrayerModel.toString());

    prayers = [
      PrayerModel(
        name: "Fajr",
        time: timePrayerModel?.data?.timings?.fajr ?? "",
      ),

      PrayerModel(
        name: "Dhuhr",
        time: timePrayerModel?.data?.timings?.dhuhr ?? "",
      ),

      PrayerModel(
        name: "Asr",
        time: timePrayerModel?.data?.timings?.asr ?? "",
      ),

      PrayerModel(
        name: "Maghrib",
        time: timePrayerModel?.data?.timings?.maghrib ?? "",
      ),

      PrayerModel(
        name: "Isha",
        time: timePrayerModel?.data?.timings?.isha ?? "",
      ),
    ];

    selectedIndex = getNextPrayerIndex();
  } else {
    log(response.errorMessage.toString());
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
                            //prayerModel.data!.timings!.asr.toString(),
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

          itemCount:prayers.length,
        ),
      ),
    );
  }
}


