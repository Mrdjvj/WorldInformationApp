import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_timer/pages/coffee_page.dart';
import 'package:world_timer/pages/events_page.dart';
import 'package:world_timer/services/info_main.dart';
import 'package:world_timer/services/weather_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world_timer/pages/pizza_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var init_info,data_weather,future_weather,info_place,hotels,places,pizza,coffee,events;

  Map data = {};
  Weather weather = Weather();
  Info info = Info();


  @override
  void initState() {
    super.initState();
    init_info = getWeatherInfo();

  }


  void urlCall(String url) async{
    final Uri uri = Uri.parse('https://$url');
    await launchUrl(uri);

  }


  Future<void> getWeatherInfo() async
  {
    await Future.delayed(Duration(microseconds: 1));
    data_weather = await weather.getWeatherData(data['location']);
    info_place = await Info().getInfo(data['location']);
    //print(data_weather['current']['temp_c']);
    var now =  DateTime.now();
    var days1 = now.add(const Duration(days: 15));
    var formatter =  DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(days1);
    future_weather = await weather.getFutureData(formattedDate, data['location']);
    hotels = await Info().getHotels(data_weather['location']['lat'],data_weather['location']['lon']);
    places = await Info().getPLaces(data_weather['location']['lat'], data_weather['location']['lon']);
    pizza = await Info().getPizza(data_weather['location']['lat'], data_weather['location']['lon']);
    coffee = await Info().getCoffee(data_weather['location']['lat'], data_weather['location']['lon']);
    events = await Info().getEvents(data['location']);
    return data_weather;

  }







  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    //print(data);

    String bgImage = data['isDaytime'] ? 'sunny.jpg' : 'night.jpg';
    //Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    //String location_weather = "";
    var result;
    var weatherIcons = ['☁','🌥','🌤','🌤','🌞','🌞','⛅','🌙'];
    var weatherTime = ['00:00','03:00','06:00','09:00','12:00','15:00','18:00','21:00'];
    var weather_details = ['Real Feel','PM 2.5','Humidity','Pressure'];






    return  Scaffold(
      body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black38,
                BlendMode.dstATop),
            image: AssetImage('assets/$bgImage'),
            fit:BoxFit.fill,
          )
        ),
        child: Column(
          children: <Widget>[

            TextButton.icon(onPressed: ()
              async {
              result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDaytime': result['isDaytime'],
                    'flag': result['flag'],
                  };
                });
              },

                label: const Row(
                  children: [

                  ],
                ),
                icon: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0,15.0,0.0,0.0),
                  child: Icon(
                      Icons.view_list_sharp,
                      color: Colors.white,
                  ),
                ),
            ),
            // TextButton.icon(
            //     onPressed: ()
            //     async{
            //       //print(location_weather);
            //       Weather().getWeatherData(data['location']);
            //       var route = MaterialPageRoute(
            //           builder: (BuildContext context) => WeatherInfo(location: data['location']),
            //       );
            //       Navigator.of(context).push(route);
            //     },
            //   label: const Text(
            //     'Check Weather',
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            //   icon: const Icon(
            //     Icons.cloud,
            //     color: Colors.black,
            //   ),
            // ),
            // TextButton.icon(
            //     onPressed: ()async{
            //       Info().getInfo(data['location']);
            //       var route = MaterialPageRoute(builder: (BuildContext context) => Info_D(location: data['location']),
            //       );
            //       Navigator.of(context).push(route);
            //     },
            //     label: const Text('Get info',
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //     ),
            //   icon: const Icon(
            //     Icons.info,
            //     color: Colors.black,
            //   ),
            // ),

           //const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              data['time'],
              style: const TextStyle(
                fontSize: 40.0,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),

      // Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
            FutureBuilder(
                future: init_info,
                builder: (context, snapshot) {

                  if(snapshot.hasData) {
                    var airportName;
                    //var hotelName = [];
                    //var hotelAddress = [];
                    //var restaurantName = [];
                    //var restaurantAddress = [];
                    if (info_place['data'][0]['children'] == null){
                      airportName = info_place['data'];
                    }
                    else {
                      airportName = info_place['data'][0]['children'];
                    }
                    //var weatherInfo = [];
                    var weatherDetails = [
                      '${data_weather['current']['feelslike_c']}°C',
                      '${data_weather['current']['air_quality']['pm2_5'].toStringAsFixed(1)}',
                      '${data_weather['current']['humidity']}%',
                      '${data_weather['current']['pressure_mb']}mbar'
                    ];
                    return Container(
                       //width: MediaQuery.of(context).size.width,
                      //height: MediaQuery.of(context).size.height,
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage('assets/$bgImage'),
                      //       fit: BoxFit.fill,
                      //     )
                      // ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
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
                                Expanded(
                                  child: Text(data_weather['current']['condition']['text'].toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                    ),
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
                                    Text(weatherIcons[index],
                                      style:const TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    Text(future_weather['forecast']['forecastday'][0]['hour'][index]['temp_c'].toString(),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(weatherTime[index],
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),)
                                  ],
                                );
                              },
                                itemCount: weatherTime.length,
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
                                  // decoration:BoxDecoration(
                                  //   border: Border.all(width: 2.0,
                                  //     color:Colors.white,
                                  //   ),
                                  //   borderRadius: BorderRadius.circular(6.0),
                                  // ),
                                  child:Column(
                                    children: [
                                      Text('Wind speed  ',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0
                                        ),
                                      ),
                                      Text('${data_weather['current']['wind_mph'].toString()} mph',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:90.0,
                                  width:90.0,
                                  // decoration:BoxDecoration(
                                  //   border: Border.all(width: 2.0,color:Colors.white,),
                                  //   borderRadius: BorderRadius.circular(6.0),
                                  // ),
                                  //color: const Color.fromARGB(100, 22, 44, 33),
                                  child: Column(
                                    children: [
                                      const Text('U.V index ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(data_weather['current']['uv'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21.0,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height:90.0,
                                  width:120.0,
                                  // decoration:BoxDecoration(
                                  //   //color:const Color(0xffe3933c),
                                  //   border: Border.all(width: 2.0,color:Colors.white,),
                                  //   borderRadius: BorderRadius.circular(6.0),
                                  // ),
                                  //color:const Color.fromARGB(100, 22, 44, 33),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text('Sunrise',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(future_weather['forecast']['forecastday'][0]['astro']['sunrise'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21.0,
                                      ),
                                      ),
                                    ],
                                  ),

                                ),
                                Container(
                                  height:90.0,
                                  width:120.0,
                                  // decoration:BoxDecoration(
                                  //   //color:const Color(0xffe3933c),
                                  //   border: Border.all(width: 2.0,color:Colors.white,),
                                  //   borderRadius: BorderRadius.circular(6.0),
                                  // ),
                                  //color: const Color.fromARGB(100, 22, 44, 33),
                                  child:  Column(
                                    children: [
                                      const Text('Sunset',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Text(future_weather['forecast']['forecastday'][0]['astro']['sunset'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 21.0,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text('Airports ✈️:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: [
                                        Text(airportName[index]['name'],
                                          style:const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ) ,
                                        )
                                      ],
                                    );
                                  },
                                  itemCount: airportName.length,
                                  itemExtent: 400.0,
                                  scrollDirection:Axis.horizontal
                              ),
                            ),
                            const Text('Popular Hotels🏤:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              height: 80.0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemBuilder: (context,index){
                                  return  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:() {
                                    (hotels['results'][index]['poi']['url'] == null)?
                                    showDialog(
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ALert'),
                                            content: Text("Url not found"),
                                            actions: [TextButton(onPressed: Navigator.of(context).pop,
                                              child: Text('Ok'),
                                            )],
                                          );
                                        }, context: context
                                    ):

                                    urlCall(hotels['results'][index]['poi']['url']);
                                  },
                                        child: Text(hotels['results'][index]['poi']['name'].toString(),
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                        ),
                                      ),
                                      Text(hotels['results'][index]['address']['freeformAddress'].toString(),
                                      style: const TextStyle(
                                      color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount :5,
                                itemExtent: 400.0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),

                            // const Text('Places To Visit🚗:',
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   fontSize: 20.0
                            // ),
                            // ),
                            // const SizedBox(height: 10.0),
                            // SizedBox(
                            //   height:80.0,
                            //   width :MediaQuery.of(context).size.width,
                            //   //padding:const EdgeInsets.only(left:2.0,right: 2.0),
                            //   child: ListView.builder(itemBuilder: (context,index) {
                            //     return Column(
                            //       children: [
                            //         GestureDetector(
                            //           onTap: (){
                            //             (places['results'][index]['poi']['url'] == null)?
                            //                 showDialog(
                            //                   builder: (BuildContext context) {
                            //                     return AlertDialog(
                            //                       title: Text('ALert'),
                            //                       content: Text("Url not found"),
                            //                       actions: [TextButton(onPressed: Navigator.of(context).pop,
                            //                           child: Text('Ok'),
                            //                       )],
                            //                     );
                            //                   }, context: context
                            //                 ):
                            //
                            //           urlCall(places['results'][index]['poi']['url']);
                            //     },
                            //           child: Text(places['results'][index]['poi']['name'].toString(),
                            //             style:const TextStyle(
                            //               fontSize: 15.0,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //         Text(places['results'][index]['address']['freeformAddress'],
                            //           style: const TextStyle(
                            //             fontSize: 15.0,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            //     itemCount: 9,
                            //     itemExtent: 400.0,
                            //     scrollDirection:Axis.horizontal ,
                            //   ),
                            // ),

                            Text('Coffee Shops',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            ),
                            SizedBox(
                              height: 130.0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemBuilder: (context,index) {
                                    return Card(

                                      child: ListTile(
                                        onTap: (){
                                          var route = MaterialPageRoute(builder: (BuildContext context) => Coffee(location: data['location']),
                                                    );
                                                    Navigator.of(context).push(route);
                                        },
                                        trailing:Image.network(coffee['local_results'][index]['thumbnail'],
                                        ),

                                        title: Text(
                                            coffee['local_results'][index]['title']),
                                        subtitle:
                                        Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Rating: ${coffee['local_results'][index]['rating'] ?? 'Not Available'} ',
                                                  style: const TextStyle(
                                                    color: Colors.orangeAccent,
                                                  ),
                                                ),
                                                Text(coffee['local_results'][index]['type'] ?? 'Not Available',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(coffee['local_results'][index]['address'] ?? 'Not Available',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                Text(coffee['local_results'][index]['description'] ?? 'Not Available',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                Text(coffee['local_results'][index]['hours'] ?? 'Not Available',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(coffee['local_results'][index]['phone'] ?? 'Not Available',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                itemCount :2,
                                itemExtent: 400.0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Text('Pizza Places',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 130.0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemBuilder: (context,index) {
                                  return Card(

                                    child: ListTile(
                                      onTap: (){
                                        var route = MaterialPageRoute(builder: (BuildContext context) => Pizza(location: data['location']),
                                        );
                                        Navigator.of(context).push(route);
                                      },
                                      trailing:Image.network(pizza['local_results'][index]['thumbnail'],
                                      ),

                                      title: Text(
                                          pizza['local_results'][index]['title']),
                                      subtitle:
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rating: ${pizza['local_results'][index]['rating'] ?? 'Not Available'} ',
                                                style: const TextStyle(
                                                  color: Colors.orangeAccent,
                                                ),
                                              ),
                                              Text(pizza['local_results'][index]['type'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(pizza['local_results'][index]['address'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(pizza['local_results'][index]['description'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(pizza['local_results'][index]['hours'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(pizza['local_results'][index]['phone'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount :2,
                                itemExtent: 400.0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Text('Upcoming Events',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 120.0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemBuilder: (context,index) {
                                  return Card(

                                    child: ListTile(
                                      onTap: (){
                                        var route = MaterialPageRoute(builder: (BuildContext context) => Events(location: data['location']),
                                        );
                                        Navigator.of(context).push(route);
                                      },
                                      trailing:Image.network(events['events_results'][index]['thumbnail'],
                                      ),

                                      title: Text(
                                          events['events_results'][index]['title']),
                                      leading: Text(events['events_results'][0]['date']['start_date'].toString(),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      subtitle:
                                      Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(events['events_results'][0]['date']['when'].toString(),
                                                maxLines: 1,),
                                              SizedBox(height: 2.0),
                                              Text(events['events_results'][0]['address'][0].toString(),
                                              ),
                                              SizedBox(height: 2.0),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount :2,
                                itemExtent: 400.0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 60.0),
                            //   child: Row(
                            //     children: [
                            //       TextButton.icon(
                            //         onPressed: (){
                            //           var route = MaterialPageRoute(builder: (BuildContext context) => Coffee(location: data['location']),
                            //           );
                            //           Navigator.of(context).push(route);
                            //         },
                            //
                            //         icon: Icon(Icons.coffee),
                            //
                            //         label: Text('Coffee Shops'),
                            //       ),
                            //       TextButton.icon(
                            //         onPressed: (){
                            //           var route = MaterialPageRoute(builder: (BuildContext context) => Pizza(location: data['location']),
                            //           );
                            //           Navigator.of(context).push(route);
                            //         },
                            //         icon: Icon(Icons.local_pizza),
                            //         label: Text('Pizza places'),
                            //       ),
                            //       TextButton.icon(
                            //         onPressed: (){
                            //           var route = MaterialPageRoute(builder: (BuildContext context) => Events(location: data['location']),
                            //           );
                            //           Navigator.of(context).push(route);
                            //         },
                            //         icon: Icon(Icons.calendar_month),
                            //         label: Text('Events'),
                            //       ),
                            //
                            //     ],
                            //
                            //   ),
                            // ),
                            SizedBox(
                              height:80.0,
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
                  return Container(
                    child:CircularProgressIndicator(
                      color: Colors.white,
                    ),

                  );
                }
            ),

          ]
        ),
      ),
        ),
    );
  }
}
