import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart'as http;
import 'package:weather_app/constants/apibase.dart';

import 'package:weather_app/modules/current_weather/model/weather.dart';

class WeatherController extends GetxController {

  Weather? weather_list;
  RxString cityName="".obs;
  RxBool on= false.obs;
  void toggle()=>on.value= on.value ? false:true;
  List<String> favoriteCity= [];



  // var box= GetStorage();

  TextEditingController? textController;

  var isLoading = false.obs;

  @override
  Future <void> onInit() async {
    // fetchWeathers();
  // getLocation();


    super.onInit();

    /*   if(data.read("city")!=null){
      cityName= data.read("city");
    }*/


    textController= TextEditingController();
    textController?.addListener(()  {
      cityName.value = textController!.text;
      debugPrint(cityName.value);

    });
  }
/*
  @override
  void onClose(){
   textController?.clear();
   textController?.dispose();
    super.onClose();
  }

*/
//---------------------------------------------------//API Part-----------------------------------------------------------



  fetchWeathers() async {

String baseUrl= Api.baseUrl;
String apiKey= Api.apiKey;

    try{
      isLoading(true);
      http.Response response =await http.get(Uri.parse("$baseUrl/current?access_key=$apiKey&query=$cityName"));

      if (response.statusCode == 200) {
        debugPrint("Data fetching successful");
//var result yazıyordu burda haberin olsun
        var result = jsonDecode(response.body);
        weather_list= Weather.fromJson(result);
        debugPrint("${weather_list?.location?.name}");

        //return locationFromJson(json);
      }
      else {
        print("Şehir seçin");
      }

    } catch(e){
      print("Error while getting data is $e");
    }
    finally{
      isLoading(false);
    }



  }




}
