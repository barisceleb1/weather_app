import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';

class Temperature extends StatelessWidget {
   Temperature({Key? key}) : super(key: key);

  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(onTap: (){
        weatherController.fetchWeathers();
      },
        child: Text("${weatherController.weather_list?.current?.temperature}C°",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w500,color: Colors.white),
        ),
      ),
    );
  }
}
