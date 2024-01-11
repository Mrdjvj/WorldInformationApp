import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Info {
  String? hotel;
  String? touristAttraction;
  String? airport;


  Info({this.hotel, this.touristAttraction, this.airport});

  Map<String, String> get headers =>
      {
        'X-RapidAPI-Key': 'bb4249b81bmsh039eb0c9e938f61p16b723jsn63822c5fda01',
        'X-RapidAPI-Host': 'tripadvisor16.p.rapidapi.com'
      };

  Future getInfo(String place) async
  {
    try {
      var url = Uri.parse(
          'https://tripadvisor16.p.rapidapi.com/api/v1/flights/searchAirport?query=$place');
      var response = await http.get(url, headers: headers);
      if (response.statusCode != 200) {
        throw Exception(
            "Request to $url failed with status ${response
                .statusCode}: ${response.body}");
      }
      Map data2 = jsonDecode(response.body);
      return data2;
    }
    catch (e) {
      debugPrint('caught error:$e');
    }
  }

  Future getHotels(double lat, double long) async
  {
    try {
      var url1 = (
          'https://api.tomtom.com/search/2/poiSearch/hotels.json?lat=$lat&lon=$long&fuelSet=&key=QsAtBx2APxGybyAelxCZSGkAB1bxsjOl'
      );
      Response response = await get(
          Uri.parse(url1));
      //print(url1);
      Map data3 = jsonDecode(response.body);
      return data3;
    }
    catch (e) {
      debugPrint('caught error:$e');
    }
  }
  Future getPLaces(double lat, double long) async
  {
    try{
      var url2 = (
      'https://api.tomtom.com/search/2/poiSearch/Tourist%20Attraction.json?lat=$lat&lon=$long&categorySet=7315&fuelSet=&key=QsAtBx2APxGybyAelxCZSGkAB1bxsjOl'
      );
      Response response = await get(
        Uri.parse(url2));
      Map data4 = jsonDecode(response.body);
      return data4;
    }
    catch(e){
      debugPrint('Caught error:$e');
    }
  }
  Future getCoffee(double lat, double long) async
  {
    try{
      var url3 = (
          'https://serpapi.com/search.json?engine=google_maps&q=coffee&ll=@$lat,$long,15.1z&type=search&api_key=3c14d208194c8c009be17834b3b88446fe0e9384db5ef144536b83fb79f6d10f'
      );
      Response response = await get(
          Uri.parse(url3));
      //print(url3);
      Map data5 = jsonDecode(response.body);
      return data5;
    }
    catch(e){
      debugPrint('Caught error:$e');
    }
  }
  Future getPizza(double lat, double long) async
  {
    try{
      var url3 = (
          'https://serpapi.com/search.json?engine=google_maps&q=pizza&ll=@$lat,$long,15.1z&type=search&api_key=3c14d208194c8c009be17834b3b88446fe0e9384db5ef144536b83fb79f6d10f'
      );
      Response response = await get(
          Uri.parse(url3));
      //print(url3);
      Map data5 = jsonDecode(response.body);
      return data5;
    }
    catch(e){
      debugPrint('Caught error:$e');
    }
  }
  Future getEvents(String location) async
  {
    try{
      var url3 = (
          'https://serpapi.com/search.json?engine=google_events&q=Events+in+$location&hl=en&gl=us&api_key=3c14d208194c8c009be17834b3b88446fe0e9384db5ef144536b83fb79f6d10f'
      );
      Response response = await get(
          Uri.parse(url3));
      //print(url3);
      Map data5 = jsonDecode(response.body);
      return data5;
    }
    catch(e){
      debugPrint('Caught error:$e');
    }
  }
}

