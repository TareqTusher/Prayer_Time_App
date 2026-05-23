class Urls {
  static String baseUrl = "https://api.aladhan.com/v1";

  static String prayerTimeUrl(String date) =>"$baseUrl/timings/$date?"
        "latitude=23.8103&"
        "longitude=-90.4125&"
        "method=3&"
        "shafaq=general&"
        "tune=5,3,5,7,9,-1,0,8,-6&"
        "school=0&"
        "midnightMode=0&"
        "timezonestring=Asia/Dhaka&"
        "latitudeAdjustmentMethod=1&"
        "calendarMethod=UAQ&"
        "iso8601=false";
}

