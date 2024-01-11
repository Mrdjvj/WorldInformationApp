import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final TextEditingController _searchController = TextEditingController();
  String searchLocation = '';


  List<WorldTime> location2 = [];

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin'),
    WorldTime(url: 'Europe/Paris', location: 'Paris'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow'),
    WorldTime(url: 'America/Toronto', location: 'Toronto'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo'),
    WorldTime(url: 'Asia/Kolkata', location: 'New Delhi'),
    WorldTime(url: 'Europe/Athens', location: 'Athens'),
    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad'),
    WorldTime(url: 'Europe/Andorra', location: 'Andorra'),
    WorldTime(url: 'Europe/Astrakhan', location: 'Astrakhan'),
    WorldTime(url: 'Europe/Belgrade', location: 'Belgrade'),
    WorldTime(url: 'Europe/Berlin', location: 'Brussels'),
    WorldTime(url: 'Europe/Bucharest', location: 'Bucharest'),
    WorldTime(url: 'Europe/Budapest', location: 'Budapest'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin'),
    WorldTime(url: 'Europe/Gibraltar', location: 'Gibraltar'),
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul'),
    WorldTime(url: 'Europe/Kyiv', location: 'Kyiv'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon'),
    WorldTime(url: 'Europe/Zurich', location: 'Zurich'),
    WorldTime(url: 'Europe/Malta', location: 'Malta'),
    WorldTime(url: 'Europe/Minsk', location: 'Minsk'),
    WorldTime(url: 'Europe/Prague', location: 'Prague'),
    WorldTime(url: 'Europe/Riga', location: 'Riga'),
    WorldTime(url: 'Europe/Rome', location: 'Rome'),
    WorldTime(url: 'Europe/Saratov', location: 'Saratov'),
    WorldTime(url: 'Europe/Tallinn', location: 'Tallinn'),
    WorldTime(url: 'Europe/Tirane', location: 'Tirane'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna'),
    WorldTime(url: 'Europe/Volgograd', location: 'Volgograd'),
    WorldTime(url: 'Europe/Warsaw', location: 'Warsaw'),
  ];

 updateTime(index,String location) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': location,
    'time': instance.time,
    'isDaytime': instance.isDaytime,
  });
}

   _performSearch<WorldTime>(String text) {
     location2.clear();
   if(text.isEmpty)
     {
       setState(() {
       });
       return;
     }
   for(var i in locations) {
     if(i.location
         .toLowerCase()
         .contains(text.toLowerCase()))
     {
       location2.add(i);
     }
     setState(() {
       //debugPrint(location2.toString());
     });
   }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
              onChanged:(String text) {
              _performSearch(text);
              setState(() {
                searchLocation = text;
              });
            }
          ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: searchLocation.isEmpty ?ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () async{
                        await updateTime(index,locations[index].location);
                      },
                      title: Text(locations[index].location),
                      // leading: CircleAvatar(
                      //   backgroundImage: AssetImage('assets/${locations[index].flag}'),
                      // ),
                    ),
                  ),
                );
              }
            ):
      ListView.builder(
          itemCount: location2.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () async{
                    await updateTime(index,location2[index].location);
                    //await updateWeather(index);
                  },
                  title: Text(location2[index].location),
                  // leading: CircleAvatar(
                  //   backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  // ),
                ),
              ),
            );
          }
      ),
        );
  }
}


