import 'package:flutter/material.dart';
import 'package:weather_api/style/styles.dart';

class ForecastWidget extends StatelessWidget {
  //виджет отображения погоды на 3 дня
  const ForecastWidget({
    Key? key,
    required this.iconCode,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.date,
  }) : super(key: key);
  final double? temperature;
  final int? humidity;
  final double? windSpeed;
  final String? iconCode;

  final String? date;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$date",
                style: StylesText().cityHourParametrsBoldStyle,
              ),
              Image.network(
                "http://openweathermap.org/img/wn/${iconCode}@2x.png",
                scale: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Температура:",
                    style: StylesText().forecastParamsStyle,
                  ),
                  Text(
                    "  $temperature°C",
                    style: StylesText().cityHourParametrsBoldStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Влажность:",
                    style: StylesText().forecastParamsStyle,
                  ),
                  Text(
                    "  $humidity%",
                    style: StylesText().cityHourParametrsBoldStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ветер:",
                    style: StylesText().forecastParamsStyle,
                  ),
                  Text(
                    "  $windSpeed м/с",
                    style: StylesText().cityHourParametrsBoldStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
