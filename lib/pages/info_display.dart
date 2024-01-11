import 'package:flutter/material.dart';
import 'package:world_timer/services/info_main.dart';
import 'package:world_timer/services/weather_main.dart';

class Info_D extends StatefulWidget {
  final String? location;
  const Info_D({Key? key,this.location}) : super(key: key);

  @override
  State<Info_D> createState() => _Info_DState();
}

class _Info_DState extends State<Info_D> {
  var init_info, info,hotels,weather_data;


  Info hotel = Info();
  @override

  @override
  void initState() {
    super.initState();
    init_info = getHotelInfo();


  }


  Future<void> getHotelInfo () async
  {
    info = await Info().getInfo(widget.location!);
    weather_data = await Weather().getWeatherData(widget.location!);
    //print(weather_data['location']['lat']);




    return info;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Back to Home'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future:init_info,
            builder: (context,snapshot){
                  var airportName;
                  var hotelName = hotels['results']['poi']['name'];
                  var hotelPhone = hotels['results']['poi']['phone'];
                  var hotelAddress = hotels['results']['address']['freeformAddress'];
              if(snapshot.hasData) {
                if (info['data'][0]['children'] == null){
                  airportName = info['data'];
                }
                else {
                  airportName = info['data'][0]['children'];
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Airports:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                  Text(airportName[index]['name'],
                                  style:const TextStyle(
                                    color: Colors.black,
                                  ) ,
                                  )
                                ],
                              );
                            },
                            itemCount: airportName.length,
                            itemExtent: 100.0,
                            scrollDirection:Axis.horizontal
                        ),
                      ),
                      //const SizedBox(height: 30.0),
                      const Text('Hotels:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemBuilder: (context,index){
                              return  Column(
                                children: [
                                  Text(hotelName[index]),
                                  Text(hotelPhone[index]),
                                  Text(hotelAddress[index]),
                                ],
                              );
                            },
                            itemCount :hotelName.length,
                            itemExtent: 400.0,
                            scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),

                );
              }
              return Container();
            }
      ),
          ],
        ),
      ),
    );
  }
}
