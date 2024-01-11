import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../services/info_main.dart';
import '../services/weather_main.dart';
import 'package:octo_image/octo_image.dart';

class Coffee extends StatefulWidget {
  final String? location;
  const Coffee({Key? key,this.location}) : super(key: key);

  @override
  State<Coffee> createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {

  var coffee, data_weather, init_info;

  Weather weather = Weather();
  Info info = Info();

  @override
  @override
  void initState() {
    super.initState();
    init_info = getWeatherInfo1();
  }


    Future<void> getWeatherInfo1() async {
      await Future.delayed(Duration(seconds: 1));
      data_weather = await Weather().getWeatherData(widget.location!);
      coffee = await Info().getCoffee(data_weather['location']['lat'], data_weather['location']['lon']);

      for (var i = 0; i < coffee['local_results'].length; i++){
        if(coffee['local_results'][i]['thumbnail'] == null)
        {
          coffee['local_results'][i]['thumbnail'] == 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png';
        }
      }
      return coffee;
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Coffee Shops'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: init_info,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                        trailing:Image.network(coffee['local_results'][0]['thumbnail'],
                        ),

                                title: Text(
                                    coffee['local_results'][0]['title']),
                                subtitle:
                                Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rating: ${coffee['local_results'][0]['rating'] ?? 'Not Available'} ',
                                          style: const TextStyle(
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                              Text(coffee['local_results'][0]['type'] ?? 'Not Available',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                              ),
                                              Text(coffee['local_results'][0]['address'] ?? 'Not Available',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                                maxLines: 1,
                                              ),
                                              Text(coffee['local_results'][0]['description'] ?? 'Not Available',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(coffee['local_results'][0]['hours'] ?? 'Not Available',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                              ),
                                              Text(coffee['local_results'][0]['phone'] ?? 'Not Available',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                              ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing: OctoImage(
                                  image: CachedNetworkImageProvider(
                                      coffee['local_results'][1]['thumbnail']),
                                  ),
                                title: Text(
                                    coffee['local_results'][1]['title']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${coffee['local_results'][1]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(coffee['local_results'][1]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][1]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][1]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(coffee['local_results'][1]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][1]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                // trailing: OctoImage(
                                //   image: CachedNetworkImageProvider(
                                //
                                //   errorBuilder: OctoError.icon(),
                                // ),
                              // trailing:OctoImage.fromSet(
                              // fit: BoxFit.cover,
                              // image: NetworkImage(coffee['local_results'][2]['thumbnail']),
                              // octoSet: OctoSet.circleAvatar(
                              // backgroundColor: Colors.red,
                              // text: Text("Your Text"),
                              // ),
                              // ),
                                trailing:Image.network((coffee['local_results'][2]['thumbnail']==null)?'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png':coffee['local_results'][2]['thumbnail']),
                                title: Text(
                                    coffee['local_results'][2]['title']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${coffee['local_results'][2]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(coffee['local_results'][2]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][2]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][2]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(coffee['local_results'][2]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][2]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing: OctoImage(
                                  image: CachedNetworkImageProvider(
                                  coffee['local_results'][3]['thumbnail']),
                                  ),
                                title: Text(
                                    coffee['local_results'][3]['title']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${coffee['local_results'][3]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(coffee['local_results'][3]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][3]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][3]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(coffee['local_results'][3]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][3]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                trailing: Image.network(
                                  coffee['local_results'][4]['thumbnail'],
                                  scale: 0.00001,
                                ),
                                title: Text(
                                    coffee['local_results'][4]['title']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rating: ${coffee['local_results'][4]['rating'] ?? 'Not Available'} ',
                                      style: const TextStyle(
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(coffee['local_results'][4]['type'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][4]['address'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][4]['description'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Text(coffee['local_results'][4]['hours'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(coffee['local_results'][4]['phone'] ?? 'Not Available',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Card(
                            //   child:ListTile(
                            //     trailing: Image.network(
                            //       coffee['local_results'][5]['thumbnail'],scale: 0.00001,
                            //     ),
                            //     title: Text(coffee['local_results'][5]['title']),
                            //     subtitle: Text('Rating: ${coffee['local_results'][5]['rating'].toString()}\n'
                            //         '${coffee['local_results'][5]['type']}\n'
                            //         '${coffee['local_results'][5]['address']}\n'
                            //         '${coffee['local_results'][5]['description']}\n'
                            //         '${coffee['local_results'][5]['hours'].toString()}\n'
                            //         '${coffee['local_results'][5]['phone'].toString()}',
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //       ),
                            //
                            //     ),
                            //   ),
                            // ),

                          ],
                        ),
                      );
                    }
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  },
                ),
              ],
            )
        ),
      );
    }
  }

