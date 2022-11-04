import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/modules/current_weather/view/home_page.dart';
import 'package:weather_app/modules/location/controller/location_controller.dart';

class LocationPage extends StatefulWidget {
   LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  final LocationController lcontroller= Get.find();
  final WeatherController weatherController= Get.find();
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("LOCATION"),centerTitle: true,backgroundColor: Colors.transparent),
        body: _buildBody(),

      ),
    );
  }

  _buildBody() {

    return RefreshIndicator( onRefresh: (){

       lcontroller.getLocation();
      return Future<void>.delayed(Duration(seconds: 1));
    },

        child:Obx((){
      /*    if (lcontroller.locLoading.value  ) {
            return Center(child:SpinKitFadingCircle(
              color: Colors.black,
              size: 70,
            ));
          }*/

            return Container(
              //color: Colors.green,
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  lcontroller.area?.value == ""
                  ?Icon(Icons.location_off,size: 100,color: Colors.red,):Icon(Icons.location_on,size: 100,color: Colors.green,),

                  Column(
                    children: [
                  //    Text('Latidute: ${weatherController.lat ?? 'Loading...'}'),
                   //   Text('Long: ${weatherController.long}'),
                      RichText(text: TextSpan(text:"Country:",style: TextStyle(fontSize:15,color: Get.isDarkMode ? Colors.white: Colors.black),children: <TextSpan>[TextSpan(
                        text: " ${lcontroller.country}",style: TextStyle(fontWeight: FontWeight.bold)
                      )])),
                      RichText(text: TextSpan(text:"Area:",style: TextStyle(fontSize:15,color: Get.isDarkMode ? Colors.white: Colors.black),children: <TextSpan>[TextSpan(
                          text: " ${lcontroller.area}",style: TextStyle(fontWeight: FontWeight.bold)
                      )])),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Column(
                      children: [
                        ElevatedButton(onPressed:lcontroller.area!="" ?((){
                          if(lcontroller.area!=null){

                            weatherController.cityName.value=lcontroller.area!.value!;
                            weatherController.fetchWeathers();
                            Get.back();

                          }


                          //  weatherController.getLocation();
                        }):null , child: Text("Location"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)),
                        lcontroller.area==""? Text("Please refresh location!"):Text(""),

                      ],
                    ),
                  )



                ],

              ),
            );




        })




    /*  if(weatherController.locLoading.value){
        return Center(child: CircularProgressIndicator(),);
      }*/






    );



  }
}
