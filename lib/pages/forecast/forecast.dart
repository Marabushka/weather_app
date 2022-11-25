import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/bloc/weather_bloc.dart';
import 'package:weather_api/pages/forecast/widgets/three_days_weather_widget.dart';

class ThreeDaysWidget extends StatefulWidget {
  @override
  _ThreeDaysWidgetState createState() => _ThreeDaysWidgetState();
}

class _ThreeDaysWidgetState extends State<ThreeDaysWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Прогноз на 3 дня')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SafeArea(child: Center(
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          //final cityName = state.weatherDetails?.city;
          final weatherData = state.forecastData;
          if (weatherData.isNotEmpty) {
            if (weatherData.first.message == 'city not found') {
              return Text("Город не найден");
            } else {
              return ThreeDaysWeatherWidget(
                dailyWeather: weatherData,
                city: state.weatherDetails?.city,
              );
            }
          }
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
        }),
      )),
    );
  }
}
