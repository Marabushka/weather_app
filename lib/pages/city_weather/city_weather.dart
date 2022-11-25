import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/bloc/weather_bloc.dart';
import 'package:weather_api/pages/city_weather/widgets/weather_page.dart';

class CityWeatherWidget extends StatefulWidget {
  @override
  _CityWeatherWidgetState createState() => _CityWeatherWidgetState();
}

class _CityWeatherWidgetState extends State<CityWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Прогноз погоды')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      //выведение данных и обработка ошибок
      body: SafeArea(child: Center(
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state.weatherDetails?.city != null &&
              state.forecastData.length > 1) {
            return WeatherPage(
              weather: state.weatherDetails!,
              dailyWeather: state.forecastData,
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text('Попробуйте еще раз или подождите'),
              ],
            );
          }
        }),
      )),
    );
  }
}
