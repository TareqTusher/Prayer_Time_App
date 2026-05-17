class TimePrayerModel {
    int? code;
    String? status;
    Data? data;

    TimePrayerModel({
        this.code,
        this.status,
        this.data,
    });

}

class Data {
    Timings? timings;
    Date? date;
    Meta? meta;

    Data({
        this.timings,
        this.date,
        this.meta,
    });

}

class Date {
    String? readable;
    String? timestamp;
    Hijri? hijri;
    Gregorian? gregorian;

    Date({
        this.readable,
        this.timestamp,
        this.hijri,
        this.gregorian,
    });

}

class Gregorian {
    String? date;
    String? format;
    String? day;
    GregorianWeekday? weekday;
    GregorianMonth? month;
    String? year;
    Designation? designation;
    bool? lunarSighting;

    Gregorian({
        this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
        this.lunarSighting,
    });

}

class Designation {
    String? abbreviated;
    String? expanded;

    Designation({
        this.abbreviated,
        this.expanded,
    });

}

class GregorianMonth {
    int? number;
    String? en;

    GregorianMonth({
        this.number,
        this.en,
    });

}

class GregorianWeekday {
    String? en;

    GregorianWeekday({
        this.en,
    });

}

class Hijri {
    String? date;
    String? format;
    String? day;
    HijriWeekday? weekday;
    HijriMonth? month;
    String? year;
    Designation? designation;
    List<String>? holidays;
    List<dynamic>? adjustedHolidays;
    String? method;

    Hijri({
        this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
        this.holidays,
        this.adjustedHolidays,
        this.method,
    });

}

class HijriMonth {
    int? number;
    String? en;
    String? ar;
    int? days;

    HijriMonth({
        this.number,
        this.en,
        this.ar,
        this.days,
    });

}

class HijriWeekday {
    String? en;
    String? ar;

    HijriWeekday({
        this.en,
        this.ar,
    });

}

class Meta {
    double? latitude;
    double? longitude;
    String? timezone;
    Method? method;
    String? latitudeAdjustmentMethod;
    String? midnightMode;
    String? school;
    Offset? offset;

    Meta({
        this.latitude,
        this.longitude,
        this.timezone,
        this.method,
        this.latitudeAdjustmentMethod,
        this.midnightMode,
        this.school,
        this.offset,
    });

}

class Method {
    int? id;
    String? name;
    Params? params;
    Location? location;

    Method({
        this.id,
        this.name,
        this.params,
        this.location,
    });

}

class Location {
    double? latitude;
    double? longitude;

    Location({
        this.latitude,
        this.longitude,
    });

}

class Params {
    int? fajr;
    int? isha;

    Params({
        this.fajr,
        this.isha,
    });

}

class Offset {
    String? imsak;
    String? fajr;
    String? sunrise;
    String? dhuhr;
    String? asr;
    String? maghrib;
    int? sunset;
    String? isha;
    String? midnight;

    Offset({
        this.imsak,
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.maghrib,
        this.sunset,
        this.isha,
        this.midnight,
    });

}

class Timings {
    String? fajr;
    String? sunrise;
    String? dhuhr;
    String? asr;
    String? sunset;
    String? maghrib;
    String? isha;
    String? imsak;
    String? midnight;
    String? firstthird;
    String? lastthird;

    Timings({
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha,
        this.imsak,
        this.midnight,
        this.firstthird,
        this.lastthird,
    });

}
