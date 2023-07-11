import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/use_case/base_use_case.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

class GetWeatherCountryName extends BaseUseCase<List<Weather>, NoParameters> {
  final BaseWeatherRepository repository;

  GetWeatherCountryName(this.repository);

  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }

  @override
  Future<Either<Failure, List<Weather>>> call(NoParameters parameters) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
