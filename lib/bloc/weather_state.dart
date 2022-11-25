part of 'weather_bloc.dart';

@immutable
class WeatherState {
  final Weather? weatherDetails;
  final List<DailyWeather> forecastData;
  final bool isLoading;
  final String errorCode;

  const WeatherState({
    this.weatherDetails,
    this.forecastData = const [],
    this.isLoading = false,
    this.errorCode = '',
  });

  WeatherState copyWith({
    Weather? weatherDetails,
    List<DailyWeather>? forecastData,
    bool isLoading = false,
    String errorCode = '',
  }) {
    return WeatherState(
      weatherDetails: weatherDetails ?? this.weatherDetails,
      forecastData: forecastData ?? this.forecastData,
      isLoading: isLoading,
      errorCode: errorCode,
    );
  }

  WeatherState clearData() => const WeatherState();
}
