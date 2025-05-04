
import 'dart:convert';

GetWeatherForecastModel getWeatherForecastModelFromJson(String str) => GetWeatherForecastModel.fromJson(json.decode(str));

String getWeatherForecastModelToJson(GetWeatherForecastModel data) => json.encode(data.toJson());

class GetWeatherForecastModel {
  final Timelines? timelines;
  final Location? location;

  GetWeatherForecastModel({
    this.timelines,
    this.location,
  });

  factory GetWeatherForecastModel.fromJson(Map<String, dynamic> json) => GetWeatherForecastModel(
    timelines: json["timelines"] == null ? null : Timelines.fromJson(json["timelines"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "timelines": timelines?.toJson(),
    "location": location?.toJson(),
  };
}

class Location {
  final double? lat;
  final double? lon;

  Location({
    this.lat,
    this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class Timelines {
  final List<Hourly>? minutely;
  final List<Hourly>? hourly;
  final List<Daily>? daily;

  Timelines({
    this.minutely,
    this.hourly,
    this.daily,
  });

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
    minutely: json["minutely"] == null ? [] : List<Hourly>.from(json["minutely"]!.map((x) => Hourly.fromJson(x))),
    hourly: json["hourly"] == null ? [] : List<Hourly>.from(json["hourly"]!.map((x) => Hourly.fromJson(x))),
    daily: json["daily"] == null ? [] : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "minutely": minutely == null ? [] : List<dynamic>.from(minutely!.map((x) => x.toJson())),
    "hourly": hourly == null ? [] : List<dynamic>.from(hourly!.map((x) => x.toJson())),
    "daily": daily == null ? [] : List<dynamic>.from(daily!.map((x) => x.toJson())),
  };
}

class Daily {
  final DateTime? time;
  final Values? values;

  Daily({
    this.time,
    this.values,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    values: json["values"] == null ? null : Values.fromJson(json["values"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "values": values?.toJson(),
  };
}

class Values {
  final double? cloudBaseAvg;
  final double? cloudBaseMax;
  final double? cloudBaseMin;
  final double? cloudCeilingAvg;
  final double? cloudCeilingMax;
  final double? cloudCeilingMin;
  final double? cloudCoverAvg;
  final double? cloudCoverMax;
  final double? cloudCoverMin;
  final double? dewPointAvg;
  final double? dewPointMax;
  final double? dewPointMin;
  final double? evapotranspirationAvg;
  final double? evapotranspirationMax;
  final double? evapotranspirationMin;
  final double? evapotranspirationSum;
  final double? freezingRainIntensityAvg;
  final double? freezingRainIntensityMax;
  final double? freezingRainIntensityMin;
  final double? hailProbabilityAvg;
  final double? hailProbabilityMax;
  final double? hailProbabilityMin;
  final double? hailSizeAvg;
  final double? hailSizeMax;
  final double? hailSizeMin;
  final double? humidityAvg;
  final double? humidityMax;
  final double? humidityMin;
  final double? iceAccumulationAvg;
  final double? iceAccumulationLweAvg;
  final double? iceAccumulationLweMax;
  final double? iceAccumulationLweMin;
  final double? iceAccumulationLweSum;
  final double? iceAccumulationMax;
  final double? iceAccumulationMin;
  final double? iceAccumulationSum;
  final DateTime? moonriseTime;
  final DateTime? moonsetTime;
  final double? precipitationProbabilityAvg;
  final double? precipitationProbabilityMax;
  final double? precipitationProbabilityMin;
  final double? pressureSurfaceLevelAvg;
  final double? pressureSurfaceLevelMax;
  final double? pressureSurfaceLevelMin;
  final double? rainAccumulationAvg;
  final double? rainAccumulationLweAvg;
  final double? rainAccumulationLweMax;
  final double? rainAccumulationLweMin;
  final double? rainAccumulationMax;
  final double? rainAccumulationMin;
  final double? rainAccumulationSum;
  final double? rainIntensityAvg;
  final double? rainIntensityMax;
  final double? rainIntensityMin;
  final double? sleetAccumulationAvg;
  final double? sleetAccumulationLweAvg;
  final double? sleetAccumulationLweMax;
  final double? sleetAccumulationLweMin;
  final double? sleetAccumulationLweSum;
  final double? sleetAccumulationMax;
  final double? sleetAccumulationMin;
  final double? sleetIntensityAvg;
  final double? sleetIntensityMax;
  final double? sleetIntensityMin;
  final double? snowAccumulationAvg;
  final double? snowAccumulationLweAvg;
  final double? snowAccumulationLweMax;
  final double? snowAccumulationLweMin;
  final double? snowAccumulationLweSum;
  final double? snowAccumulationMax;
  final double? snowAccumulationMin;
  final double? snowAccumulationSum;
  final double? snowDepthAvg;
  final double? snowDepthMax;
  final double? snowDepthMin;
  final double? snowDepthSum;
  final double? snowIntensityAvg;
  final double? snowIntensityMax;
  final double? snowIntensityMin;
  final DateTime? sunriseTime;
  final DateTime? sunsetTime;
  final double? temperatureApparentAvg;
  final double? temperatureApparentMax;
  final double? temperatureApparentMin;
  final double? temperatureAvg;
  final double? temperatureMax;
  final double? temperatureMin;
  final double? uvHealthConcernAvg;
  final double? uvHealthConcernMax;
  final double? uvHealthConcernMin;
  final double? uvIndexAvg;
  final double? uvIndexMax;
  final double? uvIndexMin;
  final double? visibilityAvg;
  final double? visibilityMax;
  final double? visibilityMin;
  final double? weatherCodeMax;
  final double? weatherCodeMin;
  final double? windDirectionAvg;
  final double? windGustAvg;
  final double? windGustMax;
  final double? windGustMin;
  final double? windSpeedAvg;
  final double? windSpeedMax;
  final double? windSpeedMin;

  Values({
    this.cloudBaseAvg,
    this.cloudBaseMax,
    this.cloudBaseMin,
    this.cloudCeilingAvg,
    this.cloudCeilingMax,
    this.cloudCeilingMin,
    this.cloudCoverAvg,
    this.cloudCoverMax,
    this.cloudCoverMin,
    this.dewPointAvg,
    this.dewPointMax,
    this.dewPointMin,
    this.evapotranspirationAvg,
    this.evapotranspirationMax,
    this.evapotranspirationMin,
    this.evapotranspirationSum,
    this.freezingRainIntensityAvg,
    this.freezingRainIntensityMax,
    this.freezingRainIntensityMin,
    this.hailProbabilityAvg,
    this.hailProbabilityMax,
    this.hailProbabilityMin,
    this.hailSizeAvg,
    this.hailSizeMax,
    this.hailSizeMin,
    this.humidityAvg,
    this.humidityMax,
    this.humidityMin,
    this.iceAccumulationAvg,
    this.iceAccumulationLweAvg,
    this.iceAccumulationLweMax,
    this.iceAccumulationLweMin,
    this.iceAccumulationLweSum,
    this.iceAccumulationMax,
    this.iceAccumulationMin,
    this.iceAccumulationSum,
    this.moonriseTime,
    this.moonsetTime,
    this.precipitationProbabilityAvg,
    this.precipitationProbabilityMax,
    this.precipitationProbabilityMin,
    this.pressureSurfaceLevelAvg,
    this.pressureSurfaceLevelMax,
    this.pressureSurfaceLevelMin,
    this.rainAccumulationAvg,
    this.rainAccumulationLweAvg,
    this.rainAccumulationLweMax,
    this.rainAccumulationLweMin,
    this.rainAccumulationMax,
    this.rainAccumulationMin,
    this.rainAccumulationSum,
    this.rainIntensityAvg,
    this.rainIntensityMax,
    this.rainIntensityMin,
    this.sleetAccumulationAvg,
    this.sleetAccumulationLweAvg,
    this.sleetAccumulationLweMax,
    this.sleetAccumulationLweMin,
    this.sleetAccumulationLweSum,
    this.sleetAccumulationMax,
    this.sleetAccumulationMin,
    this.sleetIntensityAvg,
    this.sleetIntensityMax,
    this.sleetIntensityMin,
    this.snowAccumulationAvg,
    this.snowAccumulationLweAvg,
    this.snowAccumulationLweMax,
    this.snowAccumulationLweMin,
    this.snowAccumulationLweSum,
    this.snowAccumulationMax,
    this.snowAccumulationMin,
    this.snowAccumulationSum,
    this.snowDepthAvg,
    this.snowDepthMax,
    this.snowDepthMin,
    this.snowDepthSum,
    this.snowIntensityAvg,
    this.snowIntensityMax,
    this.snowIntensityMin,
    this.sunriseTime,
    this.sunsetTime,
    this.temperatureApparentAvg,
    this.temperatureApparentMax,
    this.temperatureApparentMin,
    this.temperatureAvg,
    this.temperatureMax,
    this.temperatureMin,
    this.uvHealthConcernAvg,
    this.uvHealthConcernMax,
    this.uvHealthConcernMin,
    this.uvIndexAvg,
    this.uvIndexMax,
    this.uvIndexMin,
    this.visibilityAvg,
    this.visibilityMax,
    this.visibilityMin,
    this.weatherCodeMax,
    this.weatherCodeMin,
    this.windDirectionAvg,
    this.windGustAvg,
    this.windGustMax,
    this.windGustMin,
    this.windSpeedAvg,
    this.windSpeedMax,
    this.windSpeedMin,
  });

  factory Values.fromJson(Map<String, dynamic> json) => Values(
    cloudBaseAvg: json["cloudBaseAvg"]?.toDouble(),
    cloudBaseMax: json["cloudBaseMax"]?.toDouble(),
    cloudBaseMin: json["cloudBaseMin"].toDouble(),
    cloudCeilingAvg: json["cloudCeilingAvg"]?.toDouble(),
    cloudCeilingMax: json["cloudCeilingMax"]?.toDouble(),
    cloudCeilingMin: json["cloudCeilingMin"].toDouble(),
    cloudCoverAvg: json["cloudCoverAvg"]?.toDouble(),
    cloudCoverMax: json["cloudCoverMax"]?.toDouble(),
    cloudCoverMin: json["cloudCoverMin"]?.toDouble(),
    dewPointAvg: json["dewPointAvg"]?.toDouble(),
    dewPointMax: json["dewPointMax"]?.toDouble(),
    dewPointMin: json["dewPointMin"]?.toDouble(),
    evapotranspirationAvg: json["evapotranspirationAvg"]?.toDouble(),
    evapotranspirationMax: json["evapotranspirationMax"]?.toDouble(),
    evapotranspirationMin: json["evapotranspirationMin"]?.toDouble(),
    evapotranspirationSum: json["evapotranspirationSum"]?.toDouble(),
    freezingRainIntensityAvg: json["freezingRainIntensityAvg"].toDouble(),
    freezingRainIntensityMax: json["freezingRainIntensityMax"].toDouble(),
    freezingRainIntensityMin: json["freezingRainIntensityMin"].toDouble(),
    hailProbabilityAvg: json["hailProbabilityAvg"]?.toDouble(),
    hailProbabilityMax: json["hailProbabilityMax"]?.toDouble(),
    hailProbabilityMin: json["hailProbabilityMin"]?.toDouble(),
    hailSizeAvg: json["hailSizeAvg"]?.toDouble(),
    hailSizeMax: json["hailSizeMax"]?.toDouble(),
    hailSizeMin: json["hailSizeMin"]?.toDouble(),
    humidityAvg: json["humidityAvg"]?.toDouble(),
    humidityMax: json["humidityMax"]?.toDouble(),
    humidityMin: json["humidityMin"]?.toDouble(),
    iceAccumulationAvg: json["iceAccumulationAvg"].toDouble(),
    iceAccumulationLweAvg: json["iceAccumulationLweAvg"].toDouble(),
    iceAccumulationLweMax: json["iceAccumulationLweMax"].toDouble(),
    iceAccumulationLweMin: json["iceAccumulationLweMin"].toDouble(),
    iceAccumulationLweSum: json["iceAccumulationLweSum"].toDouble(),
    iceAccumulationMax: json["iceAccumulationMax"].toDouble(),
    iceAccumulationMin: json["iceAccumulationMin"].toDouble(),
    iceAccumulationSum: json["iceAccumulationSum"].toDouble(),
    moonriseTime: json["moonriseTime"] == null ? null : DateTime.parse(json["moonriseTime"]),
    moonsetTime: json["moonsetTime"] == null ? null : DateTime.parse(json["moonsetTime"]),
    precipitationProbabilityAvg: json["precipitationProbabilityAvg"]?.toDouble(),
    precipitationProbabilityMax: json["precipitationProbabilityMax"].toDouble(),
    precipitationProbabilityMin: json["precipitationProbabilityMin"].toDouble(),
    pressureSurfaceLevelAvg: json["pressureSurfaceLevelAvg"]?.toDouble(),
    pressureSurfaceLevelMax: json["pressureSurfaceLevelMax"]?.toDouble(),
    pressureSurfaceLevelMin: json["pressureSurfaceLevelMin"]?.toDouble(),
    rainAccumulationAvg: json["rainAccumulationAvg"]?.toDouble(),
    rainAccumulationLweAvg: json["rainAccumulationLweAvg"]?.toDouble(),
    rainAccumulationLweMax: json["rainAccumulationLweMax"]?.toDouble(),
    rainAccumulationLweMin: json["rainAccumulationLweMin"].toDouble(),
    rainAccumulationMax: json["rainAccumulationMax"]?.toDouble(),
    rainAccumulationMin: json["rainAccumulationMin"].toDouble(),
    rainAccumulationSum: json["rainAccumulationSum"]?.toDouble(),
    rainIntensityAvg: json["rainIntensityAvg"]?.toDouble(),
    rainIntensityMax: json["rainIntensityMax"]?.toDouble(),
    rainIntensityMin: json["rainIntensityMin"].toDouble(),
    sleetAccumulationAvg: json["sleetAccumulationAvg"].toDouble(),
    sleetAccumulationLweAvg: json["sleetAccumulationLweAvg"].toDouble(),
    sleetAccumulationLweMax: json["sleetAccumulationLweMax"].toDouble(),
    sleetAccumulationLweMin: json["sleetAccumulationLweMin"].toDouble(),
    sleetAccumulationLweSum: json["sleetAccumulationLweSum"].toDouble(),
    sleetAccumulationMax: json["sleetAccumulationMax"].toDouble(),
    sleetAccumulationMin: json["sleetAccumulationMin"].toDouble(),
    sleetIntensityAvg: json["sleetIntensityAvg"].toDouble(),
    sleetIntensityMax: json["sleetIntensityMax"].toDouble(),
    sleetIntensityMin: json["sleetIntensityMin"].toDouble(),
    snowAccumulationAvg: json["snowAccumulationAvg"]?.toDouble(),
    snowAccumulationLweAvg: json["snowAccumulationLweAvg"].toDouble(),
    snowAccumulationLweMax: json["snowAccumulationLweMax"]?.toDouble(),
    snowAccumulationLweMin: json["snowAccumulationLweMin"].toDouble(),
    snowAccumulationLweSum: json["snowAccumulationLweSum"]?.toDouble(),
    snowAccumulationMax: json["snowAccumulationMax"]?.toDouble(),
    snowAccumulationMin: json["snowAccumulationMin"].toDouble(),
    snowAccumulationSum: json["snowAccumulationSum"]?.toDouble(),
    snowDepthAvg: json["snowDepthAvg"]?.toDouble(),
    snowDepthMax: json["snowDepthMax"]?.toDouble(),
    snowDepthMin: json["snowDepthMin"]?.toDouble(),
    snowDepthSum: json["snowDepthSum"]?.toDouble(),
    snowIntensityAvg: json["snowIntensityAvg"].toDouble(),
    snowIntensityMax: json["snowIntensityMax"].toDouble(),
    snowIntensityMin: json["snowIntensityMin"].toDouble(),
    sunriseTime: json["sunriseTime"] == null ? null : DateTime.parse(json["sunriseTime"]),
    sunsetTime: json["sunsetTime"] == null ? null : DateTime.parse(json["sunsetTime"]),
    temperatureApparentAvg: json["temperatureApparentAvg"]?.toDouble(),
    temperatureApparentMax: json["temperatureApparentMax"]?.toDouble(),
    temperatureApparentMin: json["temperatureApparentMin"]?.toDouble(),
    temperatureAvg: json["temperatureAvg"]?.toDouble(),
    temperatureMax: json["temperatureMax"]?.toDouble(),
    temperatureMin: json["temperatureMin"]?.toDouble(),
    uvHealthConcernAvg: json["uvHealthConcernAvg"]?.toDouble(),
    uvHealthConcernMax: json["uvHealthConcernMax"]?.toDouble(),
    uvHealthConcernMin: json["uvHealthConcernMin"]?.toDouble(),
    uvIndexAvg: json["uvIndexAvg"]?.toDouble(),
    uvIndexMax: json["uvIndexMax"]?.toDouble(),
    uvIndexMin: json["uvIndexMin"]?.toDouble(),
    visibilityAvg: json["visibilityAvg"]?.toDouble(),
    visibilityMax: json["visibilityMax"]?.toDouble(),
    visibilityMin: json["visibilityMin"]?.toDouble(),
    weatherCodeMax: json["weatherCodeMax"].toDouble(),
    weatherCodeMin: json["weatherCodeMin"].toDouble(),
    windDirectionAvg: json["windDirectionAvg"]?.toDouble(),
    windGustAvg: json["windGustAvg"]?.toDouble(),
    windGustMax: json["windGustMax"]?.toDouble(),
    windGustMin: json["windGustMin"]?.toDouble(),
    windSpeedAvg: json["windSpeedAvg"]?.toDouble(),
    windSpeedMax: json["windSpeedMax"]?.toDouble(),
    windSpeedMin: json["windSpeedMin"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "cloudBaseAvg": cloudBaseAvg,
    "cloudBaseMax": cloudBaseMax,
    "cloudBaseMin": cloudBaseMin,
    "cloudCeilingAvg": cloudCeilingAvg,
    "cloudCeilingMax": cloudCeilingMax,
    "cloudCeilingMin": cloudCeilingMin,
    "cloudCoverAvg": cloudCoverAvg,
    "cloudCoverMax": cloudCoverMax,
    "cloudCoverMin": cloudCoverMin,
    "dewPointAvg": dewPointAvg,
    "dewPointMax": dewPointMax,
    "dewPointMin": dewPointMin,
    "evapotranspirationAvg": evapotranspirationAvg,
    "evapotranspirationMax": evapotranspirationMax,
    "evapotranspirationMin": evapotranspirationMin,
    "evapotranspirationSum": evapotranspirationSum,
    "freezingRainIntensityAvg": freezingRainIntensityAvg,
    "freezingRainIntensityMax": freezingRainIntensityMax,
    "freezingRainIntensityMin": freezingRainIntensityMin,
    "hailProbabilityAvg": hailProbabilityAvg,
    "hailProbabilityMax": hailProbabilityMax,
    "hailProbabilityMin": hailProbabilityMin,
    "hailSizeAvg": hailSizeAvg,
    "hailSizeMax": hailSizeMax,
    "hailSizeMin": hailSizeMin,
    "humidityAvg": humidityAvg,
    "humidityMax": humidityMax,
    "humidityMin": humidityMin,
    "iceAccumulationAvg": iceAccumulationAvg,
    "iceAccumulationLweAvg": iceAccumulationLweAvg,
    "iceAccumulationLweMax": iceAccumulationLweMax,
    "iceAccumulationLweMin": iceAccumulationLweMin,
    "iceAccumulationLweSum": iceAccumulationLweSum,
    "iceAccumulationMax": iceAccumulationMax,
    "iceAccumulationMin": iceAccumulationMin,
    "iceAccumulationSum": iceAccumulationSum,
    "moonriseTime": moonriseTime?.toIso8601String(),
    "moonsetTime": moonsetTime?.toIso8601String(),
    "precipitationProbabilityAvg": precipitationProbabilityAvg,
    "precipitationProbabilityMax": precipitationProbabilityMax,
    "precipitationProbabilityMin": precipitationProbabilityMin,
    "pressureSurfaceLevelAvg": pressureSurfaceLevelAvg,
    "pressureSurfaceLevelMax": pressureSurfaceLevelMax,
    "pressureSurfaceLevelMin": pressureSurfaceLevelMin,
    "rainAccumulationAvg": rainAccumulationAvg,
    "rainAccumulationLweAvg": rainAccumulationLweAvg,
    "rainAccumulationLweMax": rainAccumulationLweMax,
    "rainAccumulationLweMin": rainAccumulationLweMin,
    "rainAccumulationMax": rainAccumulationMax,
    "rainAccumulationMin": rainAccumulationMin,
    "rainAccumulationSum": rainAccumulationSum,
    "rainIntensityAvg": rainIntensityAvg,
    "rainIntensityMax": rainIntensityMax,
    "rainIntensityMin": rainIntensityMin,
    "sleetAccumulationAvg": sleetAccumulationAvg,
    "sleetAccumulationLweAvg": sleetAccumulationLweAvg,
    "sleetAccumulationLweMax": sleetAccumulationLweMax,
    "sleetAccumulationLweMin": sleetAccumulationLweMin,
    "sleetAccumulationLweSum": sleetAccumulationLweSum,
    "sleetAccumulationMax": sleetAccumulationMax,
    "sleetAccumulationMin": sleetAccumulationMin,
    "sleetIntensityAvg": sleetIntensityAvg,
    "sleetIntensityMax": sleetIntensityMax,
    "sleetIntensityMin": sleetIntensityMin,
    "snowAccumulationAvg": snowAccumulationAvg,
    "snowAccumulationLweAvg": snowAccumulationLweAvg,
    "snowAccumulationLweMax": snowAccumulationLweMax,
    "snowAccumulationLweMin": snowAccumulationLweMin,
    "snowAccumulationLweSum": snowAccumulationLweSum,
    "snowAccumulationMax": snowAccumulationMax,
    "snowAccumulationMin": snowAccumulationMin,
    "snowAccumulationSum": snowAccumulationSum,
    "snowDepthAvg": snowDepthAvg,
    "snowDepthMax": snowDepthMax,
    "snowDepthMin": snowDepthMin,
    "snowDepthSum": snowDepthSum,
    "snowIntensityAvg": snowIntensityAvg,
    "snowIntensityMax": snowIntensityMax,
    "snowIntensityMin": snowIntensityMin,
    "sunriseTime": sunriseTime?.toIso8601String(),
    "sunsetTime": sunsetTime?.toIso8601String(),
    "temperatureApparentAvg": temperatureApparentAvg,
    "temperatureApparentMax": temperatureApparentMax,
    "temperatureApparentMin": temperatureApparentMin,
    "temperatureAvg": temperatureAvg,
    "temperatureMax": temperatureMax,
    "temperatureMin": temperatureMin,
    "uvHealthConcernAvg": uvHealthConcernAvg,
    "uvHealthConcernMax": uvHealthConcernMax,
    "uvHealthConcernMin": uvHealthConcernMin,
    "uvIndexAvg": uvIndexAvg,
    "uvIndexMax": uvIndexMax,
    "uvIndexMin": uvIndexMin,
    "visibilityAvg": visibilityAvg,
    "visibilityMax": visibilityMax,
    "visibilityMin": visibilityMin,
    "weatherCodeMax": weatherCodeMax,
    "weatherCodeMin": weatherCodeMin,
    "windDirectionAvg": windDirectionAvg,
    "windGustAvg": windGustAvg,
    "windGustMax": windGustMax,
    "windGustMin": windGustMin,
    "windSpeedAvg": windSpeedAvg,
    "windSpeedMax": windSpeedMax,
    "windSpeedMin": windSpeedMin,
  };
}

class Hourly {
  final DateTime? time;
  final Map<String, double?>? values;

  Hourly({
    this.time,
    this.values,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    values: Map.from(json["values"]!).map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "values": Map.from(values!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
