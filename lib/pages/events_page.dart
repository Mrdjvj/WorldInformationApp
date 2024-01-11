import 'package:flutter/material.dart';
import 'package:world_timer/services/info_main.dart';
import 'package:url_launcher/url_launcher.dart';

class Events extends StatefulWidget {
  final String? location;
  const Events({Key? key,this.location}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  var events,init_info;


  Info info = Info();

  @override
  @override

  void initState() {
    super.initState();
    init_info = getWeatherInfo3();
  }


  Future<void> getWeatherInfo3() async
  {
    events = await Info().getEvents(widget.location!);
    return events;
  }
  void urlCall(String url) async{
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Events'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: init_info,
                builder: (context,snapshot){
                  if (snapshot.hasData){
                    // for(var i = 0; i < events['events_results'].length;i++)
                    //   {
                    //     var result;
                    //     result = events['events_results'][i]['date']['when'].toString();
                    //     events['events_results'][i]['date']['when'] = result.substring();
                    //   }
                    return Container(
                      child: Column(
                        children: [
                          Card(

                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][0]['link'].toString());
                              },
                              title: Text(events['events_results'][0]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              leading: Text(events['events_results'][0]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][0]['date']['when'].toString(),
                                  maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][0]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),
                                ],
                              ),
                              trailing: Image.network(events['events_results'][0]['thumbnail']),

                            ),

                          ),
                          Card(
                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][1]['link'].toString());
                              },
                              title: Text(events['events_results'][1]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),

                              ),
                              leading: Text(events['events_results'][1]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][1]['date']['when'].toString(),
                                    maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][1]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),
                                ],
                              ),
                              trailing: Image.network(events['events_results'][2]['thumbnail']),

                            ),

                          ),
                          Card(
                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][2]['link'].toString());
                              },
                              title: Text(events['events_results'][2]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),

                              ),
                              leading: Text(events['events_results'][2]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][2]['date']['when'].toString(),
                                    maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][2]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),
                                ],
                              ),
                              trailing: Image.network(events['events_results'][2]['thumbnail']),

                            ),

                          ),
                          Card(
                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][3]['link'].toString());
                              },
                              title: Text(events['events_results'][3]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),

                              ),
                              leading: Text(events['events_results'][3]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][3]['date']['when'].toString(),
                                    maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][3]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),
                                ],
                              ),
                              trailing: Image.network(events['events_results'][3]['thumbnail']),

                            ),

                          ),
                          Card(
                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][4]['link'].toString());
                              },
                              title: Text(events['events_results'][4]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),

                              ),
                              leading: Text(events['events_results'][4]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][4]['date']['when'].toString(),
                                    maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][4]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),

                                ],
                              ),
                              trailing: Image.network(events['events_results'][4]['thumbnail']),

                            ),

                          ),
                          Card(
                            child: ListTile(
                              onTap: (){
                                urlCall(events['events_results'][5]['link'].toString());
                              },
                              title: Text(events['events_results'][5]['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),

                              ),
                              leading: Text(events['events_results'][5]['date']['start_date'].toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [

                                  Text(events['events_results'][5]['date']['when'].toString(),
                                    maxLines: 1,),
                                  SizedBox(height: 2.0),
                                  Text(events['events_results'][5]['address'][0].toString(),
                                  ),
                                  SizedBox(height: 2.0),

                                ],
                              ),
                              trailing: Image.network(events['events_results'][5]['thumbnail']),

                            ),

                          ),
                        ],
                      ),
                    );
                  }
                  return const CircularProgressIndicator(
                  color: Colors.white,
                  );
                }
            )

          ],
        ),
      ),
    );
  }
}
