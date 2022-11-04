import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/view/home_page.dart';
import 'package:weather_app/modules/drawer/navigation_drawer.dart';
import 'package:weather_app/modules/favorites/view/favorites_page.dart';
import 'package:weather_app/modules/location/view/location_page.dart';
import 'package:weather_app/modules/settings/view/settings_page.dart';
class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("HELP"),centerTitle: true,
        backgroundColor: Colors.transparent,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
   
        children: [
          SizedBox(height: 5),
          Card(

            child: ListTile(
                leading: Get.isDarkMode ? Icon(Icons.star,color: Colors.white,): Icon(Icons.sunny,color: Colors.yellow,),
                title: Text("You can save your favorite cities from the add button next to the last update text on the main page."),
              onTap: (){
                  Get.to(HomePage());

              },
              ),
          ),
          Card(

            child: ListTile(
              leading: Get.isDarkMode ? Icon(Icons.star,color: Colors.white,): Icon(Icons.sunny,color: Colors.yellow,),
              title: Text("Just click on it to see the current weather conditions of the cities on the favorite page.Swipe sideways if you want to delete the city"),
              onTap: (){
                Get.to(FavoritesPage());

              },
            ),
          ),

          Card(

            child: ListTile(
              leading: Get.isDarkMode ? Icon(Icons.star,color: Colors.white,): Icon(Icons.sunny,color: Colors.yellow,),
              title: Text("You should refresh the location page and click the button to check the weather conditions of your city."),
              onTap: (){
                Get.to(LocationPage());

              },
            ),
          ),
          Card(

            child: ListTile(
              leading: Get.isDarkMode ? Icon(Icons.star,color: Colors.white,): Icon(Icons.sunny,color: Colors.yellow,),
              title: Text("If you want to change the theme of the application and want to share the application, you can go to the settings page"),
              onTap: (){
                Get.to(SettingsPage());

              },
            ),
          ),
          Card(

            child: ListTile(
              leading: Get.isDarkMode ? Icon(Icons.star,color: Colors.white,): Icon(Icons.sunny,color: Colors.yellow,),
              title: Text("Use the exit button to exit the application in a healthy way"),
              onTap: (){
                Get.to(NavigationDrawer());

              },
            ),
          ),
        ],
      ),
    );

  }
}
