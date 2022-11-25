import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_api/api_client/entity/weather.dart';

class WeatherModel extends ChangeNotifier {
  final days = <Weather>[];

  final textController = TextEditingController();
  String? errorMessage;
  String apiKey = "d9de3d7bf210e7a3c1b4a45a07c49889";

  Future<Weather?> getCurrentWeather(String city) async {
    //метод декодирования и получения погоды из JSON
    Weather? weather;

    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=ru";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        weather = Weather.fromJson(jsonDecode(response.body));
        return weather;
      } else if (response.statusCode == 404) {
        //сохранение сообщения с ошибкой

        weather = Weather(errorCode: '${response.statusCode}');
        return weather;
      }
    } catch (_) {
      weather = Weather(errorCode: '-1');
      return weather;
    } finally {
      return weather;
    }
  }

  Future<List<DailyWeather>> fetchDailyWeather(String city) async {
    //метод декодирования и получения погоды по дням из JSON
    List<DailyWeather> data;
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric&lang=ru";
    try {
      final response = await http.get(Uri.parse(url));
      Future.delayed(Duration(milliseconds: 1000), () {
        // Do something
      });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        data = (jsonData['list'] as List<dynamic>).map((item) {
          return DailyWeather.fromJson(item);
        }).toList();
        //data.sort((a, b) => a.temp!.compareTo(b.temp!));
        return data;
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (_) {
      throw Exception('Failed to load weather');
    }
  }
}
