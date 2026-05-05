import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times_app/presentation/widgets/prayer_list.dart';

class PrayerTimeSection extends StatelessWidget {
  const PrayerTimeSection({super.key});

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
            onTap: () {},
            child: Container(
              height: 50,

              decoration: BoxDecoration(
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
                        SizedBox(width: 8),

                        Text(
                          PrayerList.text[index],
                          style: TextStyle(
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
                            text: DateFormat("hh:mm ").format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.green.shade900,
                            ),
                          ),
                           TextSpan(
                            text: DateFormat("a").format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500
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
          return Divider();
        },
        itemCount: PrayerList.images.length,
      ),
    );
  }
}
