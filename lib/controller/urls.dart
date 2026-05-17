class Urls {
  static String baseUrl = "https://api.aladhan.com/v1";

  static String prayerTimeUrl(String date) {
    return "$baseUrl/timings/$date?"
        "latitude=51.5194682&"
        "longitude=-0.1360365&"
        "method=3&"
        "shafaq=general&"
        "tune=5,3,5,7,9,-1,0,8,-6&"
        "school=0&"
        "midnightMode=0&"
        "timezonestring=UTC&"
        "latitudeAdjustmentMethod=1&"
        "calendarMethod=UAQ&"
        "iso8601=false";
  }
}