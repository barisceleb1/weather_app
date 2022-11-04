import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia {facebook, twitter,whatsapp, email,linkedin }

//List name["facebook","twitter"];
class SettingsPage extends StatelessWidget {
   SettingsPage({Key? key}) : super(key: key);
  final WeatherController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("SETTINGS"),
          centerTitle: true,

        ) ,
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Obx(() => SingleChildScrollView(
      child: Stack(
        children: [

          Row(
            children: [


              Padding(
                padding: const EdgeInsets.only(left:35, top: 20),
                child: CupertinoSwitch(value: controller.on.value,
                  onChanged: (val) =>{controller.toggle(),
                    Get.isDarkMode ? Get.changeTheme(ThemeData.light()) :
                Get.changeTheme(ThemeData.dark())} ,activeColor: Colors.grey),

              ),

              Padding(
                padding: const EdgeInsets.only(left: 200, top: 30),
                child: Image.asset(controller.on.value ?"assets/ay.png":"assets/gunes.png",width: 80,height: 80,),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 6),
            child: Text("Theme Setting",style: TextStyle(fontSize: 18,color: Colors.grey),),
          ),
          Divider(color: Colors.grey,height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 90),
            child: Text(controller.on.value ? "Dark Mode" : "Light Mode"),
          ),
          Divider(color: Colors.grey,height: 240),
          Divider(color: Colors.grey,height: 301),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 125),
        child: Text("Share App",style: TextStyle(fontSize: 18,color: Colors.grey),),
      ),
       Padding(
         padding: const EdgeInsets.only(top: 150),
         child: Column(
           children: [
            buildSocialButtons(),
           ],


         ),
       )





        //  CupertinoSwitch(value: controller.on.value, onChanged: (val) =>{controller.toggle()} ,)
        ],
      ),
    ),
    );
  }

  buildSocialButtons()=> Column(
    children: [
      buildSocialButton(
        icon: FontAwesomeIcons.facebook,
        color: Color(0xFF1da1f2), onClicked: () => share(SocialMedia.facebook),
        text: Text("Facebook"),


      ),
      buildSocialButton(
        icon: FontAwesomeIcons.twitter,
        color: Colors.lightBlue.shade300, onClicked: () => share(SocialMedia.twitter),
        text: Text("Twitter"),

      ),
      buildSocialButton(
        icon: FontAwesomeIcons.whatsapp,
        color: Colors.green.shade400, onClicked: () => share(SocialMedia.whatsapp),
        text: Text("Whatsapp"),

      ),
      buildSocialButton(
        icon: FontAwesomeIcons.linkedin,
        color: Colors.blue.shade600, onClicked: () => share(SocialMedia.linkedin),
        text: Text("Linkedln"),

      ),
      buildSocialButton(
        icon: Icons.mail_outline,
        color: Colors.red, onClicked: () => share(SocialMedia.email),
        text: Text("Mail"),

      ),
    ],

  );

  buildSocialButton({required IconData icon,  Color? color,required VoidCallback onClicked(), required Text text}){
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children:[ListTile(
          visualDensity: VisualDensity(vertical: -4),
          trailing: Icon(Icons.chevron_right),

          title:
          Row(
            children: [
              SizedBox(
                child: InkWell(

                  child: FaIcon(icon,color: color,size: 30,),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: text,
              )

            ],

          ),
          onTap:onClicked,

        ),


        ]
      ),
    );

  }



  share(SocialMedia socialPlatform) async{
    final subject= "Best Weather App";
    final text= "You can find my app on my Github page.";
    final urlShare= Uri.encodeComponent("https://github.com/barisceleb1/weather_app");

    final urls= {
      SocialMedia.facebook:"https://www.facebook.com/sharer.php?u=$urlShare&t=$text",
      SocialMedia.twitter:"https://twitter.com/internet/tweet?url=$urlShare&text=$text",
      SocialMedia.whatsapp:"https://api.whatsapp.com/send?text=$text$urlShare",
      SocialMedia.linkedin:"https://www.linkedin.com/shareArticle?mini=true&url=$urlShare",
      SocialMedia.email:"mailto:?subject=$subject&body=$text\n\n$urlShare",
    };
    final url= urls[socialPlatform]!;
     await launch(url);

  }


}
