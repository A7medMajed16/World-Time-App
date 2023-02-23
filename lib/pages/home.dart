import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //set background
    String bgImage = data['isDaytime'] ? 'assets/dayTime.jpg' : 'assets/nightTime.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.white : Colors.pink[900];
    Color? fontColor = data['isDaytime'] ? Colors.black : Colors.white;
    Color? buttonColor = data['isDaytime'] ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          fontFamily: 'FiraSans'
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                      data['time'],
                    style: TextStyle(
                      color: fontColor,
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: fontColor,
                    ),
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location_sharp,
                        color: buttonColor,
                      ),
                      label: Text(
                        'Edite you location',
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: buttonColor,
                        ),
                      ),
                  ),

                ],
              ),
            ),
          ),
      ),
    );
  }
}
