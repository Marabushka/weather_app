import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/models/weather_model.dart';

import '../api_client/entity/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

// Данный блок отвечает как за получение общих деталей погоды,
// так и за получения массива по прогнозу погоды. По этой причине
// он имеет два события. Состояние агрегатное - оно хранит как
// общие детали погоды, так и массив прогноза погоды.
// Изменение состояния происходит через методы copyWith и clearData
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _api = WeatherModel();
  String _query = '';
  WeatherBloc() : super(const WeatherState()) {
    on<GetWeatherDetailsEvent>(_getWeatherDetailsEvent);
    on<GetWeatherForecastEvent>(_getWeatherForecastEvent);
  }

  Future<void> _getWeatherDetailsEvent(
      GetWeatherDetailsEvent event, Emitter<WeatherState> emit) async {
    emit(state.clearData());
    _query = event.cityName;
    emit(state.copyWith(isLoading: true));
    try {
      final weatherDetails = await _api.getCurrentWeather(_query);
      emit(state.copyWith(weatherDetails: weatherDetails));
    } catch (e) {}
  }

  Future<void> _getWeatherForecastEvent(
      GetWeatherForecastEvent event, Emitter<WeatherState> emit) async {
    if (state.forecastData.isNotEmpty) return;
    emit(state.copyWith(isLoading: true));
    try {
      List<DailyWeather> weatherForecast = await _api.fetchDailyWeather(_query);

      emit(state.copyWith(forecastData: weatherForecast));
    } catch (e) {}
  }
}
