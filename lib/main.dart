import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/weather_cubit.dart';


void main() {
  runApp(BlocProvider(
     create: (context) {
        return WeatherCubit(WeatherService());
      },
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()  ,
      ),
      home: Homepage(),
    );
  }
}
