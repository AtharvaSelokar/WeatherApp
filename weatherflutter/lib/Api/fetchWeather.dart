import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherflutter/Api/ApiKeys.dart';
import 'package:weatherflutter/Models/weather/weatherData.dart';
import 'package:weatherflutter/Models/weather/weatherDataDaily.dart';
import 'package:weatherflutter/Models/weather/weatherDataHourly.dart';
import '../Models/weather/weatherDataCurrent.dart';

class fetchWeatherAPI{
  WeatherData? weatherData;
  //processing data from response to json
Future<WeatherData> processData(lat,lon)async{
  var response=await http.get(Uri.parse(apiURL(lat, lon)));
  var jsonString=jsonDecode(response.body);
  weatherData=WeatherData(current: WeatherDataCurrent.fromJson(jsonString),
      hourly: WeatherDataHourly.fromJson(jsonString),daily: WeatherDataDaily.fromJson(jsonString)
  );
  return weatherData!;
}
}

String apiURL(var lat,var lon) {
  String URL;
  URL =
  "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$ApiKey&units=metric&exclude=minutely";

  return URL;
}