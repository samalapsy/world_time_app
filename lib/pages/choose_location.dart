import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.svg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'be.svg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.svg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.svg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'ch.svg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.svg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.svg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'mc.svg'),
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'ng.svg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'ae.svg'),
    WorldTime(
        url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'sa.svg'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'time': instance.time,
      'flag': instance.flag,
      'location': instance.location,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap: () {
                updateTime(index);
              },
              leading: new SvgPicture.asset('images/flags/ng.svg'),
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
