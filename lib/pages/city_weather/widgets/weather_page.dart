import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:weather_api/api_client/entity/weather.dart';

import 'package:weather_api/pages/city_weather/widgets/hour_weather_widget.dart';
import 'package:weather_api/style/styles.dart';

class WeatherPage extends StatelessWidget {
  final Weather weather;
  final List<DailyWeather> dailyWeather;
  const WeatherPage(
      {Key? key, required this.weather, required this.dailyWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<int, String> weekdayName = {
      1: "Понедельник",
      2: "Вторник",
      3: "Среда",
      4: "Четверг",
      5: "Пятница",
      6: "Суббота",
      7: "Воскресенье"
    };

    //виджет экрана погоды

    return Stack(
      children: [
        //задний фон
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //отображение информации о городе
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("${weekdayName[weather.date?.weekday]}, ${weather.date?.day}",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${weather.city}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesText().cityStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${weather.temp}°", style: StylesText().cityTempStyle),
                    Image.network(
                      "http://openweathermap.org/img/wn/${weather.iconCode}@2x.png",
                      scale: 0.8,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ощущается:",
                      style: StylesText().cityParametrsStyle,
                    ),
                    Text(
                      '${weather.feelsLike}° C',
                      style: StylesText().cityParametrsBoldStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Влажность:",
                      style: StylesText().cityParametrsStyle,
                    ),
                    Text(
                      "${weather.humidity}%",
                      style: StylesText().cityParametrsBoldStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ветер:",
                      style: StylesText().cityParametrsStyle,
                    ),
                    Text(
                      "${weather.windSpeed}м/с",
                      style: StylesText().cityParametrsBoldStyle,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HourWeatherWidget(dailyWeather: dailyWeather),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
