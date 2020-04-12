import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Lagos', url: 'Africa/Lagos', flag: 'ng.svg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'flag': instance.flag,
      'location': instance.location,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'World Time',
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
