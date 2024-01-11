
import 'package:flutter/material.dart';
import 'package:world_timer/pages/coffee_page.dart';
import 'package:world_timer/pages/home.dart';
import 'package:world_timer/pages/location_display.dart';
import 'package:world_timer/pages/loading.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: '/',
    routes: {
      '/': (context) =>  Loading(),
      '/home': (context) =>  Home(),
      '/location':(context) =>  ChooseLocation(),
      //'/weather':(context) => WeatherInfo(),
      //'/hotel':(context) =>  Info_D(),
      '/coffee':(context) => Coffee(),
    },
  ));
}

