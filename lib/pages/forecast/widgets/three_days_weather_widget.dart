import 'package:flutter/material.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/pages/forecast/widgets/sort.dart';
import 'package:weather_api/style/styles.dart';

class ThreeDaysWeatherWidget extends StatelessWidget {
  final List<DailyWeather> dailyWeather;
  final String? city;
  const ThreeDaysWeatherWidget(
      {Key? key, required this.dailyWeather, required this.city})
      : super(key: key);

  @override
  //виджет экрана погоды на 3 дня
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "http://openweathermap.org/img/wn/${dailyWeather[0].iconCode}@2x.png",
                ),
                Text("$city", style: StylesText().cityStyle),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white.withOpacity(0.15),
                ),
                width: MediaQuery.of(context).size.width,
                child: SortWidget(dailyWeather: dailyWeather),
              ),
            )
          ],
        )
      ],
    );
  }
}
