import 'package:flutter/material.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/pages/forecast/widgets/forecast_widget.dart';

class SortWidget extends StatelessWidget {
  SortWidget({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final List<DailyWeather> dailyWeather;
  final Map<int, String> weekdayName = {
    1: "Понедельник",
    2: "Вторник",
    3: "Среда",
    4: "Четверг",
    5: "Пятница",
    6: "Суббота",
    7: "Воскресенье"
  };
//виджет сортировки погоды
//самый холодный день сверху
  @override
  Widget build(BuildContext context) {
    if (dailyWeather[0].temp! < dailyWeather[8].temp! &&
        dailyWeather[0].temp! < dailyWeather[16].temp!) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date:
                  "${weekdayName[dailyWeather[0].date?.weekday]}, ${dailyWeather[0].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date:
                  "${weekdayName[dailyWeather[8].date?.weekday]}, ${dailyWeather[8].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date:
                  "${weekdayName[dailyWeather[16].date?.weekday]}, ${dailyWeather[16].date?.day}"),
        ],
      );
    } else if (dailyWeather[8].temp! < dailyWeather[0].temp! &&
        dailyWeather[8].temp! < dailyWeather[16].temp!) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date:
                  "${weekdayName[dailyWeather[8].date?.weekday]}, ${dailyWeather[8].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date:
                  "${weekdayName[dailyWeather[0].date?.weekday]}, ${dailyWeather[0].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date:
                  "${weekdayName[dailyWeather[16].date?.weekday]}, ${dailyWeather[16].date?.day}"),
        ],
      );
    } else if (dailyWeather[16].temp! < dailyWeather[0].temp! &&
        dailyWeather[16].temp! < dailyWeather[8].temp!) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date:
                  "${weekdayName[dailyWeather[16].date?.weekday]}, ${dailyWeather[16].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date:
                  "${weekdayName[dailyWeather[0].date?.weekday]}, ${dailyWeather[0].date?.day}"),
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date:
                  "${weekdayName[dailyWeather[8].date?.weekday]}, ${dailyWeather[8].date?.day}"),
        ],
      );
    }
    return SizedBox();
  }
}
