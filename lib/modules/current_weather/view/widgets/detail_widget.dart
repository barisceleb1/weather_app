import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/constant.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/model/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_icons/weather_icons.dart';

class Detail extends StatelessWidget {
 Detail({Key? key}) : super(key: key);
 final WeatherController weatherController = Get.find();
  final Decorations= BoxDecoration(boxShadow: [BoxShadow(color: Colors.transparent.withOpacity(0.1),)] );
  @override
  Widget build(BuildContext context) {
    return  ListView(children: [

      Stack(
        children: [
          Container(decoration: Decorations,margin: EdgeInsets.only(left: 30),width: 150,height: 150,child: Padding(
            padding: const EdgeInsets.only(left: 35,top: 15),
            child: Text("Wind Speed",style: TextStyle(color: AppColor.classicColor),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0,top: 40),
            child: Image.asset("assets/wind.png",color: AppColor.classicColor,width: 40,height: 40,)
          ),
          Padding(
              padding: const EdgeInsets.only(left: 77.0,top: 85),
              child: Text("${weatherController.weather_list?.current?.windSpeed} km/s",style: TextStyle(color: Colors.white),),
          ),
          Container(decoration: Decorations,margin: EdgeInsets.only(left: 30,top: 180),width: 150,height: 150,child: Padding(
            padding: const EdgeInsets.only(left: 43,top: 15),
            child: Text("Pressure",style: TextStyle(color: AppColor.classicColor),
            ),
          ),),
          Padding(
            padding: const EdgeInsets.only(left: 80,top: 225),
            child: Image.asset("assets/pressure.png",color: AppColor.classicColor,width: 33,height: 33,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72,top: 272),
            child: Text("${weatherController.weather_list?.current?.pressure} mb",style: TextStyle(color: Colors.white),),
          ),
          Container(decoration: Decorations,margin: EdgeInsets.only(left: 230),width: 150,height: 150,child: Padding(
            padding: const EdgeInsets.only(left: 50,top: 15),
            child: Text("Humidity",style: TextStyle(color: AppColor.classicColor),),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 265,top: 22),
            child: Image.asset("assets/humidity.png",color: AppColor.classicColor,width: 75,height: 75,),
          ),
          Padding(
            padding: const EdgeInsets.only(left:290,top: 85),
            child: Text("${weatherController.weather_list?.current?.humidity}%",style: TextStyle(color: AppColor.classicColor),),
          ),
          Container(decoration: Decorations,margin: EdgeInsets.only(left: 230,top: 180),width: 150,height: 150,child: Padding(
            padding: const EdgeInsets.only(left:50,top: 15),
            child: Text("Visibility",style: TextStyle(color: AppColor.classicColor),),
          ),),
          Padding(
            padding: const EdgeInsets.only(left:284, top: 218),
            child: Image.asset("assets/visibility.png",width: 40,height: 40,color: AppColor.classicColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(left:285,top: 272),
            child: Text("${weatherController.weather_list?.current?.visibility} km",style: TextStyle(color: AppColor.classicColor),),
          ),
        ],


      )


    ],);
  }
}
