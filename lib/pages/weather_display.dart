import 'package:flutter/material.dart';
import 'package:world_timer/services/weather_main.dart';
import 'package:intl/intl.dart';


class WeatherInfo extends StatefulWidget {
    final String? location;
   WeatherInfo({Key? key, this.location}) : super(key: key);


  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  var data_weather;
  var init_weather;
  var future_weather;


  Weather weather = Weather();
  @override



  @override
  void initState() {
    super.initState();
    init_weather = getWeather();


  }


  Future<void> getWeather() async{

    //print(widget.location);
    data_weather  = await weather.getWeatherData(widget.location!);
    // print(data_weather['current']['temp_c']);
    // print(data_weather['current']['feelslike_c']);
    print(data_weather['location']['lat']);
    print(data_weather['location']['lon']);

    var now =  DateTime.now();
    var days1 =
    now.add(const Duration(days: 15));
    var formatter =  DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(days1);
    future_weather =  await weather.getFutureData(formattedDate, widget.location!);
    return data_weather;

  }


  @override
  Widget build(BuildContext context) {
    var weather_icons = ['☁','🌥','🌤','🌤','🌞','🌞','⛅','🌙'];
    var weather_time = ['00:00','03:00','06:00','09:00','12:00','15:00','18:00','21:00'];
    var weather_details = ['Real Feel','PM 2.5','Humidity','Pressure'];

      return Scaffold(
        //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Back to Home'),
        elevation: 0.0,
        leading: TextButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/home', arguments: {
              'location': 'London',
              'flag': 'greece.png',
              'time': '12:52',
              'isDaytime': true,
            });
          },
          child: Text('<'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: init_weather,
                  builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    String bgImage = data_weather['current']['is_day'] == 0 ? 'night.png' : 'day.png';
                    var weatherInfo = [
                      future_weather['forecast']['forecastday'][0]['hour'][0]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][1]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][2]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][3]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][4]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][5]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][6]['temp_c'],
                      future_weather['forecast']['forecastday'][0]['hour'][7]['temp_c'],
                    ];
                    var weatherDetails = [
                      '${data_weather['current']['feelslike_c']}°C',
                      '${data_weather['current']['air_quality']['pm2_5'].toStringAsFixed(1)}',
                      '${data_weather['current']['humidity']}%',
                      '${data_weather['current']['pressure_mb']}mbar'
                    ];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/$bgImage'),
                              fit: BoxFit.fill,
                            )
                        ),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${data_weather['current']['temp_c'].toString()}°C",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 70.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text(data_weather['current']['condition']['text'].toString(),maxLines: 2,
                            textAlign: TextAlign.center,
                                  style: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                            ],
                          ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: 140.0,
                              width :MediaQuery.of(context).size.width,
                              child: ListView.builder(itemBuilder: (context,index) {
                                return Column(
                                  children: [
                                    Text(weather_icons[index],
                                      style:const TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    Text(weatherInfo[index].toString(),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(weather_time[index],
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),)
                                  ],
                                );
                              },
                                itemCount: weatherInfo.length,
                                itemExtent: 100.0,
                                scrollDirection:Axis.horizontal ,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height:90.0,
                                    width:90.0,
                                    decoration:BoxDecoration(
                                      border: Border.all(width: 2.0,
                                      color:Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    //color:const Color.fromARGB(100, 22, 44, 33),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('The wind speed in mph is: '
                                          '${data_weather['current']['wind_mph'].toString()}',
                                      ),
                                    ],
                                  ),
                                  ),
                                  Container(
                                    height:90.0,
                                    width:90.0,
                                    decoration:BoxDecoration(
                                      border: Border.all(width: 2.0,color:Colors.grey,),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    //color: const Color.fromARGB(100, 22, 44, 33),
                                    child: Column(
                                      children: [
                                        Text('The U.V index is:${data_weather['current']['uv']}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                            ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height:90.0,
                          width:90.0,
                          decoration:BoxDecoration(
                            //color:const Color(0xffe3933c),
                            border: Border.all(width: 2.0,color:Colors.grey,),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          //color:const Color.fromARGB(100, 22, 44, 33),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Sunrise:'
                              '            '
                                  '${future_weather['forecast']['forecastday'][0]['astro']['sunrise'].toString()}',
                                style:const TextStyle(
                                  //fontStyle:
                                ),
                              ),
                            ],
                          ),

                        ),
                        Container(
                          height:90.0,
                          width:90.0,
                          decoration:BoxDecoration(
                            //color:const Color(0xffe3933c),
                            border: Border.all(width: 2.0,color:Colors.grey,),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          //color: const Color.fromARGB(100, 22, 44, 33),
                          child: Column(
                            children: [
                              Text('Sunset:'
                                    '                      '

                                  '${future_weather['forecast']['forecastday'][0]['astro']['sunset']}',
                                style:const TextStyle(
                                  //fontSize: 20.0,
                                  //fontStyle:
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                            const SizedBox(
                                height: 128.0),
                            SizedBox(
                              height:58.0,
                              width :MediaQuery.of(context).size.width,
                              //padding:const EdgeInsets.only(left:2.0,right: 2.0),
                              child: ListView.builder(itemBuilder: (context,index) {
                                return Column(
                                  children: [
                                    Text(weatherDetails[index].toString(),
                                      style:const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(weather_details[index],
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                );
                              },
                                itemCount: weatherDetails.length,
                                itemExtent: 150.0,
                                scrollDirection:Axis.horizontal ,
                              ),
                            ),

                    ]

                        ),
                    );
                  }
                  return Container();
                  }
                    ),
                  ]


        ),
      ),

                  );
        }
}
