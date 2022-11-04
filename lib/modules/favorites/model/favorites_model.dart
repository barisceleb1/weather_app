class Favorites{
  String? text;
  int? favoritetemp;
  int? favoritefeltTemp;
  String? favoriteImage;
  String? favoriteWeather;
  bool done;

  Favorites({ this.text, this.done=false, this.favoritetemp, this.favoritefeltTemp, this.favoriteImage, this.favoriteWeather});

  factory Favorites.fromJason(Map<String, dynamic> json)=> Favorites(text:json ['text'], done: json['done'], favoritetemp: json['favoritetemp'],
      favoritefeltTemp: json['favoritefeltTemp'], favoriteImage:json['favoriteImage'],favoriteWeather: json['favoriteWeather']);

  Map<String, dynamic> toJson()=>{'text': text, 'done':done, 'favoritetemp':favoritetemp,
    'favoritefeltTemp':favoritefeltTemp, 'favoriteImage':favoriteImage, 'favoriteWeather':favoriteWeather};

}