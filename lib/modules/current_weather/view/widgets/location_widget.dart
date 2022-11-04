import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';

class Location extends StatelessWidget {
  //constants ({Key? key}) : super(key: key);
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(weatherController.weather_list?.location?.name != null){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          "${weatherController.weather_list?.location?.name}",overflow: TextOverflow.ellipsis, style: TextStyle(
           color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500
        ),
        ),
      );
    }
    else{
      return Text("");
    }

  }
}


//

