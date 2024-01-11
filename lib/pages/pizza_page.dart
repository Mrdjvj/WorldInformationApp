import 'package:flutter/material.dart';
import 'package:world_timer/services/info_main.dart';
import 'package:world_timer/services/weather_main.dart';

class Pizza extends StatefulWidget {
  final String? location;
  const Pizza({Key? key,this.location}) : super(key: key);

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  var pizza,data_weather,init_info;

  Weather weather = Weather();
  Info info = Info();

  @override
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    init_info = getWeather();
  }


  Future<void> getWeather() async
  {
    data_weather = await Weather().getWeatherData(widget.location!);
    pizza = await Info().getPizza(data_weather['location']['lat'], data_weather['location']['lon']);
    for (var i = 0; i < pizza['local_results'].length; i++){
      if(pizza['local_results'][i]['thumbnail'] == null)
      {
        pizza['local_results'][i]['thumbnail'] == 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
      }
    }
    return pizza;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Places'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: init_info,
                builder: (context,snapshot){
                  if(snapshot.hasData)
                    {
                      return Container(
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network(pizza['local_results'][0]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][0]['title'],
                                ),
                                subtitle:
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           'Rating: ${pizza['local_results'][0]['rating'] ?? 'Not Available'} ',
                                           style: const TextStyle(
                                             color: Colors.orangeAccent,
                                           ),
                                         ),
                                         Text(pizza['local_results'][0]['type'] ?? 'Not Available',
                                           style: const TextStyle(
                                             color: Colors.black,
                                           ),
                                         ),
                                         Text(pizza['local_results'][0]['address'] ?? 'Not Available',
                                           style: const TextStyle(
                                             color: Colors.black,
                                           ),
                                           maxLines: 1,
                                         ),
                                         Text(pizza['local_results'][0]['description'] ?? 'Not Available',
                                           style: const TextStyle(
                                             color: Colors.black,
                                           ),
                                           maxLines: 1,
                                         ),
                                         Text(pizza['local_results'][0]['hours'] ?? 'Not Available',
                                           style: const TextStyle(
                                             color: Colors.black,
                                           ),
                                         ),
                                         Text(pizza['local_results'][0]['phone'] ?? 'Not Available',
                                           style: const TextStyle(
                                             color: Colors.black,
                                           ),
                                         ),

                                       ],
                                     ),



                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network(pizza['local_results'][1]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][1]['title'],
                                ),
                                subtitle:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${pizza['local_results'][1]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(pizza['local_results'][1]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][1]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][1]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][1]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][1]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network((pizza['local_results'][2]['thumbnail']==null)?'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png':pizza['local_results'][2]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][2]['title'],
                                ),
                                subtitle:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${pizza['local_results'][2]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(pizza['local_results'][2]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][2]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][2]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][2]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][2]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network(pizza['local_results'][3]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][3]['title'],
                                ),
                                subtitle:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${pizza['local_results'][3]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(pizza['local_results'][3]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][3]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][3]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][3]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][3]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network(pizza['local_results'][4]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][4]['title'],
                                ),
                                subtitle:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${pizza['local_results'][4]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(pizza['local_results'][4]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][4]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][4]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][4]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][4]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing:
                                Image.network(pizza['local_results'][5]['thumbnail'],
                                  height:100,
                                  width: 100,
                                ),
                                title: Text(
                                  pizza['local_results'][5]['title'],
                                ),
                                subtitle:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${pizza['local_results'][5]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(pizza['local_results'][5]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][5]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][5]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(pizza['local_results'][5]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(pizza['local_results'][5]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                  ],
                                ),



                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  return CircularProgressIndicator(
                    color: Colors.white,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
