import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  final String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  // Just like a JS Promise
  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false; // > 6 and < 8pm
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error from get time: $e');
      time = 'Could not get time';
    }
  }
}
