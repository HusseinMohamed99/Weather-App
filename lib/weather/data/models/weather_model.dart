import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.id,
    super.cityName,
    super.main,
    super.description,
    super.temp,
    super.pressure,
    super.maxTemp,
    super.minTemp,
  );
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        json["id"],
        json["name"],
        json["weather"][0]["main"],
        json["weather"][0]["description"],
        json["main"]["temp"],
        json["main"]["pressure"],
        json["main"]["temp_max"],
        json["main"]["temp_min"],
      );
}
