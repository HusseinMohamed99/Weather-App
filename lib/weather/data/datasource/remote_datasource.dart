import 'package:dio/dio.dart';
import 'package:weather_app/core/utilis/constances.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future <WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async{

    final response = await Dio().get('${AppConstances.baseUrl}/weather?q=$cityName&appid=${AppConstances.appKey}');
    print(response.data);
    return WeatherModel.fromJson(response.data);

  }

}