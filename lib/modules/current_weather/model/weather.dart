// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';
//import 'dart:html';

//List<Weather> weatherFromJson(String str) => List<Weather>.from(json.decode(str)['location'].map((x)=> Weather.fromJson(Map<String, dynamic>.from(x))));
//List<Location> locationFromJson(String str) => List<Location>.from(json.decode(str)['location'].map((x)=> Location.fromJson(Map<String, dynamic>.from(x))));
Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());


class Weather {
  Weather({
    this.request,
    this.location,
    this.current,
  });

  Request? request;
  Location? location;
  Current? current;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    request: json["request"] == null ? null : Request.fromJson(json["request"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "request": request == null ? null : request!.toJson(),
    "location": location == null ? null : location!.toJson(),
    "current": current == null ? null : current!.toJson(),
  };
}

class Current {
  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });

  String? observationTime;
  int? temperature;
  int? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? precip;
  int? humidity;
  int? cloudcover;
  int? feelslike;
  int? uvIndex;
  int? visibility;
  String? isDay;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    observationTime: json["observation_time"] == null ? null : json["observation_time"],
    temperature: json["temperature"] == null ? null : json["temperature"],
    weatherCode: json["weather_code"] == null ? null : json["weather_code"],
    weatherIcons: json["weather_icons"] == null ? null : List<String>.from(json["weather_icons"].map((x) => x)),
    weatherDescriptions: json["weather_descriptions"] == null ? null : List<String>.from(json["weather_descriptions"].map((x) => x)),
    windSpeed: json["wind_speed"] == null ? null : json["wind_speed"],
    windDegree: json["wind_degree"] == null ? null : json["wind_degree"],
    windDir: json["wind_dir"] == null ? null : json["wind_dir"],
    pressure: json["pressure"] == null ? null : json["pressure"],
    precip: json["precip"] == null ? null : json["precip"],
    humidity: json["humidity"] == null ? null : json["humidity"],
    cloudcover: json["cloudcover"] == null ? null : json["cloudcover"],
    feelslike: json["feelslike"] == null ? null : json["feelslike"],
    uvIndex: json["uv_index"] == null ? null : json["uv_index"],
    visibility: json["visibility"] == null ? null : json["visibility"],
    isDay: json["is_day"] == null ? null : json["is_day"],
  );

  Map<String, dynamic> toJson() => {
    "observation_time": observationTime == null ? null : observationTime,
    "temperature": temperature == null ? null : temperature,
    "weather_code": weatherCode == null ? null : weatherCode,
    "weather_icons": weatherIcons == null ? null : List<dynamic>.from(weatherIcons!.map((x) => x)),
    "weather_descriptions": weatherDescriptions == null ? null : List<dynamic>.from(weatherDescriptions!.map((x) => x)),
    "wind_speed": windSpeed == null ? null : windSpeed,
    "wind_degree": windDegree == null ? null : windDegree,
    "wind_dir": windDir == null ? null : windDir,
    "pressure": pressure == null ? null : pressure,
    "precip": precip == null ? null : precip,
    "humidity": humidity == null ? null : humidity,
    "cloudcover": cloudcover == null ? null : cloudcover,
    "feelslike": feelslike == null ? null : feelslike,
    "uv_index": uvIndex == null ? null : uvIndex,
    "visibility": visibility == null ? null : visibility,
    "is_day": isDay == null ? null : isDay,
  };
}

class Location {
  Location({
    required this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  String name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  int? localtimeEpoch;
  String? utcOffset;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"] == null ? null : json["name"],
    country: json["country"] == null ? null : json["country"],
    region: json["region"] == null ? null : json["region"],
    lat: json["lat"] == null ? null : json["lat"],
    lon: json["lon"] == null ? null : json["lon"],
    timezoneId: json["timezone_id"] == null ? null : json["timezone_id"],
    localtime: json["localtime"] == null ? null : json["localtime"],
    localtimeEpoch: json["localtime_epoch"] == null ? null : json["localtime_epoch"],
    utcOffset: json["utc_offset"] == null ? null : json["utc_offset"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "country": country == null ? null : country,
    "region": region == null ? null : region,
    "lat": lat == null ? null : lat,
    "lon": lon == null ? null : lon,
    "timezone_id": timezoneId == null ? null : timezoneId,
    "localtime": localtime == null ? null : localtime,
    "localtime_epoch": localtimeEpoch == null ? null : localtimeEpoch,
    "utc_offset": utcOffset == null ? null : utcOffset,
  };
}

class Request {
  Request({
    this.type,
    this.query,
    this.language,
    this.unit,
  });

  String? type;
  String? query;
  String? language;
  String? unit;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    type: json["type"] == null ? null : json["type"],
    query: json["query"] == null ? null : json["query"],
    language: json["language"] == null ? null : json["language"],
    unit: json["unit"] == null ? null : json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "query": query == null ? null : query,
    "language": language == null ? null : language,
    "unit": unit == null ? null : unit,
  };
}
