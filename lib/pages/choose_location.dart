import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Africa/Cairo',location: 'Cairo',flag: 'egypt.png'),
    WorldTime(url:'Africa/Tunis',location: 'Tunis',flag: 'tunis.png'),
    WorldTime(url:'Asia/Dubai',location: 'Dubai',flag: 'uae.png'),
    WorldTime(url:'Asia/Gaza',location: 'Gaza',flag: 'syrian.png'),
    WorldTime(url:'Europe/London',location: 'London',flag: 'uk.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B728E),
      appBar: AppBar(
        backgroundColor: const Color(0xff474E68),
        title: const Text(
            'Choose location',
          style: TextStyle(
            letterSpacing: 2.0,
            color: Colors.white,
            fontSize: 22.0,
            fontFamily: 'FiraSans',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                color: const Color(0xFF404258),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location??"",
                    style: const TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(
                      image:AssetImage('assets/${locations[index].flag}'),
                    ),
                  )
                ),
              ),
            );
          },
      ),

    );
  }
}
