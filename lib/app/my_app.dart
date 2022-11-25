import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_api/bloc/weather_bloc.dart';

import 'package:weather_api/pages/choose_city/choose_city.dart';
import 'package:weather_api/pages/city_weather/city_weather.dart';
import 'package:weather_api/pages/forecast/forecast.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = WeatherBloc();
    return BlocProvider(
        create: (context) => weatherBloc,
        child: MaterialApp(
          title: 'Weather Project',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          routes: {
            '/city_weather_widget': (context) =>
                CityWeatherWidget(), //основной экран погоды
            '/city_weather_widget/three_days_weather_widget': (context) =>
                ThreeDaysWidget(), //погода по дням
          },
          home: const ChooseCityWidget(), //выбор города
        ));
  }
}
