import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String countryName;
  const GetWeatherEvent({required this.countryName});
}
