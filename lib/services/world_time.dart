import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;
  late String time;

  late String url;
  bool isDaytime = false;



  WorldTime({ required this.url, required this.location});

  Future <void> getTime() async {
    try {
      Response response = await get(
          Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now);

    }

    catch (e) {
      debugPrint('caught error:$e');
      time = 'Could not get time';
    }
  }
}

