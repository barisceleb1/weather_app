import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/favorites/view/favorites_page.dart';
import 'package:weather_app/modules/help/view/help_page.dart';
import 'package:weather_app/modules/location/view/location_page.dart';
import 'package:weather_app/modules/settings/view/settings_page.dart';
import 'package:page_transition/page_transition.dart';


class NavigationDrawer extends StatelessWidget {
   NavigationDrawer({Key? key}) : super(key: key);

  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade500,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),

        ),
    );
  }
  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  ) ;
  Widget buildMenuItems (BuildContext context) => Container(
    padding: EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 10,
      children: [
        ListTile(
          leading: Icon(Icons.home,color: Colors.white),
          title: Text("Home",style: TextStyle( fontSize: 15)),
          onTap:()=> Get.back(), //Get.to(() => HomePage()),
        ),
        Divider(color: Colors.black),
        ListTile(
          leading: Icon(Icons.favorite,color: Colors.white,),
          title: Text("Favorites",style: TextStyle( fontSize: 15)),
          onTap: (){
            Get.back();
            Navigator.of(context).push(PageTransition(child: FavoritesPage(), type: PageTransitionType.fade));

          }
        ),
        ListTile(
            leading: Icon(Icons.location_on, color: Colors.white,),
            title: Text("Location", style: TextStyle(fontSize: 15),),
            onTap: (){
              Get.back();
              //Get.to(LocationPage());
              Navigator.of(context).push(PageTransition(child: LocationPage(), type: PageTransitionType.fade));


            }
        ),

        ListTile(
          leading: Icon(Icons.settings, color: Colors.white),
          title: Text("Settings",style: TextStyle( fontSize: 15)),
          onTap: (){
            Get.back();
            //Get.to(() => SettingsPage());
            Navigator.of(context).push(PageTransition(child: SettingsPage(), type: PageTransitionType.fade));
          }
        ),
        ListTile(
            leading: Icon(Icons.help, color: Colors.white,),
            title: Text("Help", style: TextStyle(fontSize: 15),),
            onTap: (){
              Get.back();
              //Get.to(LocationPage());
              Navigator.of(context).push(PageTransition(child: HelpPage(), type: PageTransitionType.fade));


            }
        ),

        ListTile(
          leading: Icon(Icons.exit_to_app_outlined, color: Colors.white,),
          title: Text("Exit", style: TextStyle(fontSize: 15),),
          onTap: ()=> Get.defaultDialog(title: "Do you want to exit?",middleText:"",onConfirm:()=>exit(0) ,onCancel: ()=> Get.back(), barrierDismissible: false),
        ),







      ],
    ),
  );
}
