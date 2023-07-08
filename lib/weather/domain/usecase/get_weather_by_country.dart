import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

class GetWeatherCountryName{

final BaseWeatherRepository repository;

  GetWeatherCountryName(this.repository);

 Future<Weather> execute(String cityName)async
  {
    return await repository.getWeatherByCityName(cityName);
  }
}