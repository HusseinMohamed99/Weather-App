import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/enum.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherState extends Equatable {
  final List<Weather> weatherModel;
  final RequestState weatherState;
  final String weatherMessage;

  const WeatherState({
    this.weatherModel = const [],
    this.weatherState = RequestState.loading,
    this.weatherMessage = "",
  });

  WeatherState copyWith({
    List<Weather>? weatherModel,
    RequestState? weatherState,
    String? weatherMessage,
  }) {
    return WeatherState(
      weatherModel: weatherModel ?? this.weatherModel,
      weatherState: weatherState ?? this.weatherState,
      weatherMessage: weatherMessage ?? this.weatherMessage,
    );
  }

  @override
  List<Object?> get props => [
        weatherModel,
        weatherState,
        weatherMessage,
      ];
}
