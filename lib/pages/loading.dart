import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Cairo',flag: 'egypt.png',url: 'Africa/Cairo');
    await instance.getTime();
    //ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 80.0,
          shape: BoxShape.rectangle,
          duration: Duration(milliseconds: 1000),
        ),
      )
    );
  }
}
