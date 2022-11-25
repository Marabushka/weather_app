import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_api/bloc/weather_bloc.dart';
import 'package:weather_api/style/styles.dart';

class chooseCity extends StatefulWidget {
  const chooseCity({Key? key}) : super(key: key);

  @override
  State<chooseCity> createState() => _chooseCityState();
}

class _chooseCityState extends State<chooseCity> {
  String _query = '';
  final _searchTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
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
        //гиф
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //виджет поиска

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => setState(() => _query = value),
                controller: _searchTextFieldController,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.sunny, color: Colors.yellow),
                  border: OutlineInputBorder(),
                  hintText: 'Введите ваш город',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //кнопка подтвердить
            SizedBox(
              width: 100,
              height: 100,
              child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  if (state.weatherDetails != null &&
                      state.forecastData.length > 1) {
                    Navigator.of(context)
                        .pushReplacementNamed('/city_weather_widget');
                  }
                  if (state.weatherDetails?.errorCode != null) {
                    _showErrorSnackBar(
                      state.weatherDetails?.errorCode,
                      150,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }
                  if (state.errorCode.isNotEmpty) {
                    return Container();
                  } else {
                    return Container();
                  }
                },
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.5))))),
              onPressed: _query.trim() == ''
                  ? null
                  : () => AddBlocs(_query, weatherBloc),
              child: Text(
                'Подтвердить',
                style: StylesText().buttonStyle,
              ),
            )
          ],
        ),
      ],
    );
  }

  void _showErrorSnackBar(String? errorCode, double position) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        margin: EdgeInsets.only(
          bottom: position,
          left: 20,
          right: 20,
        ),
        shape: const StadiumBorder(),
        content: Text(
          errorCode == '404'
              ? 'Город не найден'
              : errorCode == '-1'
                  ? 'Не удалось получить ответ с сервера'
                  : 'Неизвестная ошибка',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

AddBlocs(String text, WeatherBloc weatherBloc) {
  weatherBloc.add(GetWeatherDetailsEvent(text.trim()));
  weatherBloc.add(GetWeatherForecastEvent());
}
