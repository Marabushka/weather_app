import 'package:flutter/material.dart';
import 'package:weather_api/pages/choose_city/widgets/choose_city_widget.dart';

class ChooseCityWidget extends StatefulWidget {
  const ChooseCityWidget({Key? key}) : super(key: key);

  @override
  State<ChooseCityWidget> createState() => _ChooseCityWidgetState();
}

class _ChooseCityWidgetState extends State<ChooseCityWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Прогноз погоды')),
      ),
      body: chooseCity(),
    );
  }
}
