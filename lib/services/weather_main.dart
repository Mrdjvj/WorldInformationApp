import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';



class Weather {
   double? temp_c;
   double? feelslike_c;
   String? conditon;
   double? pm2_5;
   double? humidity;
   int is_day = 0;
   double? pressure_mb;

  Weather({
     this.temp_c = 0.0,
     this.feelslike_c = 0.0,
     this.conditon = 'Sunny',
     this.pm2_5 = 2.5,
     this.humidity = 0.0,
     this.pressure_mb = 0.0,

  });


  Future  getWeatherData(String place) async {
    try {
      var url = 'http://api.weatherapi.com/v1/current.json?key=1cf4a454edc8406794a155939233108&q=$place&aqi=yes';
      //var url1 = 'http://api.weatherapi.com/v1/future.json?key=5842627ab2b942d8ada60441233005&q=$place&dt';
      //print(url);
      Response response = await get(
          Uri.parse(url));
      Map data1 = jsonDecode(response.body);
      //debugPrint(data1.toString());
      return data1;
    }

    catch (e) {
      debugPrint('caught error:$e');
    }
  }
   Future  getFutureData( date,String place) async {
     try {
       //print('$date $place');
       var url1 = 'http://api.weatherapi.com/v1/future.json?key=1cf4a454edc8406794a155939233108&q=$place&dt=$date';
       //print(url1);
       Response response = await get(
           Uri.parse(url1));
       Map data2 = jsonDecode(response.body);
       return data2;
     }

     catch (e) {
       debugPrint('caught error:$e');
     }
   }
  }


