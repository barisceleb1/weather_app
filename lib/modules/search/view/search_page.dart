

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/view/home_page.dart';


class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final WeatherController controller = Get.find();

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(

        appBar:AppBar(title: Text("Search"),centerTitle: true,backgroundColor: Colors.transparent,) ,
        body: Column(
          children: [
            Form(
              child: Row(
                //    mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.textController,

                        // controller: c.textController,
                        decoration: InputDecoration(

                          hintText:"Write city ",
                          labelText: "Choose city",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      //
                    ),
                  ),

                  IconButton(onPressed: (){_tiklandi();}
                    ,icon: Icon(Icons.search,),),

//resultta text.controller yazıyordu
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _tiklandi() {
    Get.back(result: controller.cityName.value );HomePage();
    debugPrint("Kullanıcının seçtiği şehir: ${controller.textController?.text}");





    if(controller.cityName.value !="" && controller.cityName.value != null){
      {controller.fetchWeathers();Get.snackbar("City selected","" ,duration: Duration(seconds: 1),);}
    }


   else if( controller.cityName.value== "" || controller.textController?.text != ""){
      Get.snackbar("You didn't choose a city", "",duration: Duration(seconds: 1));
    }

  }

}

