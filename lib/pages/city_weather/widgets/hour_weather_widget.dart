import 'package:flutter/material.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/style/styles.dart';

class HourWeatherWidget extends StatelessWidget {
  const HourWeatherWidget({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final List<DailyWeather> dailyWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //отображение информации о погоде
      children: [
        ParametrsRow(
            icon: dailyWeather[0].iconCode,
            leftParams: "${dailyWeather[0].date?.hour}:00",
            rightParams: '${dailyWeather[0].temp}° C'),
        ParametrsRow(
            icon: dailyWeather[1].iconCode,
            leftParams: "${dailyWeather[1].date?.hour}:00",
            rightParams: '${dailyWeather[1].temp}° C'),
        ParametrsRow(
            icon: dailyWeather[2].iconCode,
            leftParams: "${dailyWeather[2].date?.hour}:00",
            rightParams: '${dailyWeather[2].temp}° C'),
        ParametrsRow(
            icon: dailyWeather[3].iconCode,
            leftParams: "${dailyWeather[3].date?.hour}:00",
            rightParams: '${dailyWeather[3].temp}° C'),
        ParametrsRow(
            icon: dailyWeather[4].iconCode,
            leftParams: "${dailyWeather[4].date?.hour}:00",
            rightParams: '${dailyWeather[4].temp}° C'),
        ParametrsRow(
            icon: dailyWeather[5].iconCode,
            leftParams: "${dailyWeather[5].date?.hour}:00",
            rightParams: '${dailyWeather[5].temp}° C'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/city_weather_widget/three_days_weather_widget');
            },
            child: Text(
              'Прогноз на 3 дня',
              style: StylesText().buttonStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class ParametrsRow extends StatelessWidget {
  String leftParams;
  String rightParams;
  String? icon;
  ParametrsRow({
    Key? key,
    required this.leftParams,
    required this.rightParams,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftParams,
          style: StylesText().cityHourParametrsBoldStyle,
        ),
        Row(
          children: [
            Image.network(
              "http://openweathermap.org/img/wn/${icon}@2x.png",
              scale: 2.5,
            ),
            Text(
              rightParams,
              style: StylesText().cityHourParametrsBoldStyle,
            ),
          ],
        )
      ],
    );
  }
}
